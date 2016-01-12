module Rooftop
  module Events
    class Instance
      include Rooftop::Post
      include Rooftop::Events::MetaAttributes
      self.api_namespace = "rooftop-events"
      self.api_version = 2
      self.api_endpoint = "events/:event_id/instances"
      belongs_to :event, class: "Rooftop::Events::Event"
    end
  end
end