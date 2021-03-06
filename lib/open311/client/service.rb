module Open311
  class Client
    module Service
      # Provide a list of acceptable 311 service request types and their associated service codes
      #
      # @format :xml
      # @key false
      # @param options [Hash] A customizable set of options.
      # @return [Array]
      # @see http://wiki.open311.org/GeoReport_v2#GET_Service_List
      # @example Provide a list of acceptable 311 service request types and their associated service codes
      #   Open311.service_list
      def service_list(options={})
        options.merge!(:jurisdiction_id => jurisdiction)
        response = get('dev/v2/services', options)
        format.to_s.downcase == 'xml' ? response['services']['service'] : response
      end
    end
  end
end
