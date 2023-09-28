module Request
  module JsonHelpers
    def json_response
      @json_response ||= JSON.parse(response.body, symlize_names: true)    
    end
  end
end