module Rooftop
  module Events
    class TicketType
      include Rooftop::Post
      self.api_namespace = "rooftop-events"
      self.api_version = 2
    end
  end
end