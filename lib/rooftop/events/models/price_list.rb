module Rooftop
  module Events
    class PriceList
      include Rooftop::Post
      self.api_namespace = "rooftop-events"
      self.api_version = 2
      # has_many :prices, class: "Rooftop::Events::Price"



      def prices
        Price.all(_price_list_id: self.id).with_embedded_resources
      end

    end
  end
end