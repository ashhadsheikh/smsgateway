require "uri"
require "net/http"
require "net/https"

class API

  API_ENDPOINT = 'https://smsgateway.me/api/v4/'

  def self.get(endpoint, id)
    uri = URI.parse(API_ENDPOINT + endpoint + "#{id}")
    http = Net::HTTP.new(uri.host, uri.port)  
    http.use_ssl = true
    req = Net::HTTP::Get.new(uri.path)  
    req['Authorization'] = SMSGateway.configuration.authorization_token
    resp = http.request(req)  
  end

  def self.post(endpoint, params)   
    uri     = URI.parse(API_ENDPOINT + endpoint)
    http    = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.path)
    request['Authorization'] = SMSGateway.configuration.authorization_token
    if endpoint == 'callback'
      request.body = "#{params}"
    else
      request.body = "[ #{params} ]"
    end
    response = http.request(request)
  end

  def self.put(endpoint, params) 
    uri     = URI.parse(API_ENDPOINT + endpoint)
    http    = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Put.new(uri.path)
    request['Authorization'] = SMSGateway.configuration.authorization_token
    request.body = "#{params}"
    response = http.request(request)
  end
end