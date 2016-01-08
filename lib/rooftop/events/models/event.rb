module Rooftop
  module Events
    class Event
      include Rooftop::Post
      self.api_namespace = "rooftop-events"
      self.api_version = 2
      has_many :instances, class: "Rooftop::Events::Instance"
    end
  end
end