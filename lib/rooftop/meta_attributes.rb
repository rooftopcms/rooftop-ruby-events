module Rooftop
  module Events
    module MetaAttributes
      def self.included(base)
        meta_method = case base.to_s.demodulize.underscore
                        when 'event'
                          :event_meta
                        else
                          :"event_#{base.to_s.demodulize.underscore}_meta"
                      end
        base.send(:after_find, ->(record) {

          if record.respond_to?(meta_method)
            record.meta_attributes = record.send(meta_method) || {}
          else
            record.meta_attributes = {}
          end

        })

        # before saving, we need to move stuff from custom_attributes back to meta_[event|event_instance]
        base.send(:before_save, ->(record) {
          record.send(:"#{meta_method}=", record.meta_attributes)
        })
      end



    end
  end
end