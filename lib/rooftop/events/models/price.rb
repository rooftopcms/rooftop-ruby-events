module Rooftop
  module Events
    class Price
      include Rooftop::Post
      self.api_namespace = "rooftop-events"
      self.api_version = 2
      self.api_endpoint = "price_lists/:price_list_id/prices"
      belongs_to :price_list, class: "Rooftop::Events::PriceList"

      def price_band
        # TODO - we should be able to call resolve() on these links

        # PriceBand.find(id)
      end

      def ticket_type
        # TODO - we should be able to call resolve() on these links
        href = resource_links.find_by(link_type: "ticket_type").first.href
        id = href.split("=").last
        # TicketType.find(id)
      end

    end
  end



end