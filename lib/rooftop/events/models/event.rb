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
          _embedded[:instances].first.collect {|e| Rooftop::Events::Instance.new(e.merge(event_id: self.id, modified: DateTime.now, date: DateTime.now)).tap {|i| i.run_callbacks(:find)}}
        else
          raise NoMethodError, "You need to find this event with (include_embedded_resources: true, no_filter: [:include_embedded_resources])"
        end
      end
    end
  end
end
