module Rooftop
  module Events
    class Price
      include Rooftop::Post
      include Rooftop::Events::MetaAttributes
      self.api_namespace = "rooftop-events"
      self.api_version = 2
      # self.api_endpoint = "price_lists/:price_list_id/prices"

      def initialize(args)
        super
        if _embedded
          @_price_list_id = _embedded[:price_list].first[:id]
        end
      end

      def price_band
        # TODO - we should be able to call resolve() on these links
        PriceBand.find(_embedded[:price_band].first[:id])
      end

      def ticket_type
        # TODO - we should be able to call resolve() on these links
        TicketType.find(_embedded[:ticket_type].first[:id])
      end

      # def _price_list_id
      #   _embedded[:price_list].first[:id]
      # end


    end
  end



end