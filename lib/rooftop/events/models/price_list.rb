module Rooftop
  module Events
    class PriceList
      include Rooftop::Post
      self.api_namespace = "rooftop-events"
      self.api_version = 2
      has_many :prices, class: "Rooftop::Events::Price"

    end
  end
end