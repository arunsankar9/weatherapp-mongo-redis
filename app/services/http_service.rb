require 'uri'
require 'net/http'

class HttpService

  def self.get url, use_ssl = true
    url = URI(url)
    http = Net::HTTP.new(url.host, url.port)
    if use_ssl
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
    return response.read_body
  end

end
