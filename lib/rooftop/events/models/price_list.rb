module Rooftop
  module Events
    class PriceList
      include Rooftop::Post
      include Rooftop::Events::MetaAttributes
      self.api_namespace = "rooftop-events"
      self.api_version = 2
      has_many :prices, class: "Rooftop::Events::Price"

      def prices
        if self.respond_to?(:_embedded) && self._embedded.try(:has_key?, :prices)
          self._embedded[:prices].first.collect{|p| Price.new(p.merge({_price_list_id: self.id}))}
        else
          Price.all(_price_list_id: self.id).with_embedded_resources
        end
      end

    end
  end
end
