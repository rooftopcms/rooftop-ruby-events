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
    end
  end
end
