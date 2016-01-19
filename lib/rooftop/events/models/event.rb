module Rooftop
  module Events
    class Event
      include Rooftop::Post
      include Rooftop::Events::MetaAttributes
      self.api_namespace = "rooftop-events"
      self.api_version = 2
      has_many :instances, class: "Rooftop::Events::Instance"

      def related_events
        Event.get("#{self.class.collection_path}/#{self.id}/related_events")
      end
    end
  end
end
