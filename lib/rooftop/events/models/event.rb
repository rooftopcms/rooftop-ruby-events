module Rooftop
  module Events
    class Event
      include Rooftop::Post
      include Rooftop::Events::MetaAttributes
      self.api_namespace = "rooftop-events"
      self.api_version = 2
      has_many :instances, class: "Rooftop::Events::Instance"

      def related_events(opts = {})
        default_opts = {
          per_page: 10
        }
        opts[:per_page] = opts[:count]
        opts = default_opts.merge(opts)
        Event.get("#{self.class.collection_path}/#{self.id}/related_events?#{opts.to_query}")
      end

      def embedded_instances
        if respond_to?(:_embedded) && self._embedded.has_key?(:instances)
          _embedded[:instances].first.collect do |e|
            Rooftop::Events::Instance.new(e.merge(event_id: self.id, modified: DateTime.now, date: DateTime.now, event_slug: self.slug, event_title: self.title)).tap {|i| i.run_callbacks(:find)}
          end
        else
          raise NoMethodError, "You need to find this event with (include_embedded_resources: true, no_filter: [:include_embedded_resources])"
        end
      end

      def is_bookable?
        if self.respond_to?(:event_instance_availabilities) && event_instance_availabilities.flatten.any?
          sorted = Hash[event_instance_availabilities.first.sort_by{|instance_id, availability| DateTime.parse(availability[:starts_at])}]

          DateTime.parse(sorted[sorted.keys.last][:starts_at]).future? && sorted.collect{|i,a| a[:seats_available].to_i}.sum > 0
        end
      end

      def is_sold_out?
        !is_bookable?
      end

    end
  end
end
