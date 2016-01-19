module Rooftop
  module Events
    class Instance
      include Rooftop::Post
      include Rooftop::Events::MetaAttributes
      self.api_namespace = "rooftop-events"
      self.api_version = 2
      self.api_endpoint = "events/:event_id/instances"
      belongs_to :event, class: "Rooftop::Events::Event"

      def price_list
        if respond_to?(:_embedded)
          PriceList.find(_embedded[:price_list].first[:id])
        end
      end
      
    end
  end
end
