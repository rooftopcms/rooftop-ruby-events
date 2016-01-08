module Rooftop
  module Events
    class Price
      include Rooftop::Post
      self.api_namespace = "rooftop-events"
      self.api_version = 2
      self.api_endpoint = "price_lists/:price_list_id/prices"
      belongs_to :price_list, class: "Rooftop::Events::PriceList"

      def price_band
        resource_links.find_by(link_type: "price_band").first.resolve
      end

      def ticket_type
        resource_links.find_by(link_type: "ticket_type").first.resolve
      end

    end
  end



end