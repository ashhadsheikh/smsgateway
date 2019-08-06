require 'json'
require 'api'
require 'configuration'

module SMSGateway

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end


  class Message

    API_ENDPOINT = 'message/'

    attr_accessor  :device_id, :phone_number, :message, :id, :status, :created_at, :updated_at, :log

    def initialize(device_id, phone_number, message, id = nil, status = nil, created_at = nil, updated_at = nil, log = nil)  
      @id           = id
      @device_id    = device_id  
      @phone_number = phone_number  
      @message      = message  
      @status       = status
      @updated_at   = updated_at
      @created_at   = created_at
      @log          = log
    end  

    def send
      result = nil
      params = { device_id: @device_id, phone_number: @phone_number, message: @message }.to_json

      response = API.post(API_ENDPOINT + 'send', params)
      if response.code == '200'
        res = JSON.parse(response.body)
        @id           = res[0]['id']
        @device_id    = res[0]['device_id']  
        @phone_number = res[0]['phone_number']  
        @message      = res[0]['message']  
        @status       = res[0]['status']
        @updated_at   = res[0]['updated_at']
        @created_at   = res[0]['created_at']
        @log          = res[0]['log']
        result        = self
      end

      result
    end

    def cancel
      result = nil
      params = { id: @id }.to_json

      response = API.post(API_ENDPOINT + 'cancel', params)
      if response.code == '200'
        res = JSON.parse(response.body)
        @id           = res[0]['id']
        @device_id    = res[0]['device_id']  
        @phone_number = res[0]['phone_number']  
        @message      = res[0]['message']  
        @status       = res[0]['status']
        @updated_at   = res[0]['updated_at']
        @created_at   = res[0]['created_at']
        @log          = res[0]['log']
        result        = self
      end

      result
    end

    def self.where(params)
      result = nil
      search_params = []
      tokens = params.split('AND')
      tokens.each do |tkn|
        tkn = tkn.split('=')
        params = { field: tkn[0].strip!, operator: '=', value: tkn[1].delete("'").strip!}
        search_params << params
      end

      params = { filters: [ search_params ], order_by: [ { field: 'created_at', direction: 'desc'}, limit: 5, offset: 5]  }.to_json
      response = API.post(API_ENDPOINT + 'search', params)
      if response.code == '200'
        res = JSON.parse(response.body)['results']
        converted_objects = []
        res.each do |obj|
          converted_objects << Message.new(obj['device_id'], obj['phone_number'], obj['message'], obj['id'], obj['status'], obj['created_at'], obj['updated_at'], obj['log'])
        end
        result = converted_objects
      end

      result
    end

    def self.all
      result = nil
      params = { filters: [] }.to_json
      response = API.post(API_ENDPOINT + 'search', params)
      if response.code == '200'
        res = JSON.parse(response.body)['results']
        converted_objects = []
        res.each do |obj|
          converted_objects << Message.new(obj['device_id'], obj['phone_number'], obj['message'], obj['id'], obj['status'], obj['created_at'], obj['updated_at'], obj['log'])
        end
        result = converted_objects
      end

      result
    end

    def self.find(id)
      result = nil
      response = API.get(API_ENDPOINT, id)

      if response.code == '200'
        res = JSON.parse(response.body)
        result = Message.new(res['device_id'], res['phone_number'], res['message'], res['id'], res['status'], res['created_at'], res['updated_at'], res['log'])
      end

      result
    end
  end

  class Device

    API_ENDPOINT = 'device/'

    attr_accessor :id, :name, :attributes

    def initialize(id, name, attributes)  
      @id = id
      @name = name  
      @attributes = attributes  
    end 

    def self.find(id)
      result = nil
      response = API.get(API_ENDPOINT, id)
      if response.code == '200'
        res = JSON.parse(response.body)
        result = Device.new(res['id'], res['name'], res['attributes'])
      end

      result
    end

    def self.all
      result = nil
      params = { filters: [] }.to_json
      response = API.post(API_ENDPOINT + 'search', params)
      if response.code == '200'
        res = JSON.parse(response.body)['results']
        converted_objects = []
        res.each do |obj|
          converted_objects << Device.new(obj['id'], obj['name'], obj['attributes'])
        end
        result = converted_objects
      end

      result
    end

    def self.where(params)
      result = nil
      search_params = []
      tokens = params.split('AND')
      tokens.each do |tkn|
        tkn = tkn.split('=')
        params = { field: tkn[0].strip!, operator: '=', value: tkn[1].delete("'").strip!}
        search_params << params
      end

      params = { filters: [ search_params ], order_by: [ { field: 'type', direction: 'desc'}, limit: 5, offset: 5]  }.to_json
      response = API.post(API_ENDPOINT + 'search', params)
      if response.code == '200'
        res = JSON.parse(response.body)['results']
        converted_objects = []
        res.each do |obj|
          converted_objects << Device.new(obj['id'], obj['name'], obj['attributes'])
        end
        result = converted_objects
      end

      result
    end
  end

  class Contact

    API_ENDPOINT = 'contact'

    attr_accessor :id, :name, :phone_numbers

    def initialize(name, phone_numbers, id = nil)  
      @id = id
      @name = name  
      @phone_numbers = phone_numbers  
    end 

    def save
      params = { name: @name, phone_numbers: @phone_numbers }.to_json
      response = API.post(API_ENDPOINT, params)
      if response.code == '200'
        res = JSON.parse(response.body)
        @id = res[0]['id']
        @name = res[0]['name']  
        @phone_numbers = res[0]['phone_numbers']  
        result = self
      end

      result
    end

    def self.find(id)
      result = nil
      response = API.get(API_ENDPOINT + '/', id)
      if response.code == '200'
        res = JSON.parse(response.body)
        result = Contact.new(res['name'], res['phone_numbers'], res['id'])
      end

      result
    end

    def self.where(params)
      result = nil
      search_params = []
      tokens = params.split('AND')
      tokens.each do |tkn|
        tkn = tkn.split('=')
        params = { field: tkn[0].strip!, operator: '=', value: tkn[1].delete("'").strip!}
        search_params << params
      end

      params = { filters: [ search_params ], order_by: [ { field: 'name', direction: 'desc'}, limit: 5, offset: 5]  }.to_json
      response = API.post(API_ENDPOINT + '/search', params)
      if response.code == '200'
        res = JSON.parse(response.body)['results']
        converted_objects = []
        res.each do |obj|
          converted_objects << Contact.new(obj['name'], obj['phone_numbers'], obj['id'])
        end
        result = converted_objects
      end

      result
    end

    def self.all
      result = nil
      params = { filters: [] }.to_json
      response = API.post(API_ENDPOINT + '/search', params)
      if response.code == '200'
        res = JSON.parse(response.body)['results']
        converted_objects = []
        res.each do |obj|
          converted_objects << Contact.new(obj['name'], obj['phone_numbers'], obj['id'])
        end
        result = converted_objects
      end

      result
    end

    def update
      params = { name: @name, phone_numbers: @phone_numbers }.to_json
      response = API.put(API_ENDPOINT + "/#{@id}", params)
      if response.code == '200'
        res = JSON.parse(response.body)
        @id = res['id']
        @name = res['name']  
        @phone_numbers = res['phone_numbers']  
        result = self
      end

      result
    end
  end

  class Callback

    API_ENDPOINT = 'callback/'

    attr_accessor :name, :event, :device_id, :filter_type, :filter, :method, :action, :secret

    def initialize(name=nil, event=nil, device_id=nil, filter_type=nil, filter=nil, method=nil, action=nil, secret=nil, id=nil)
      @name = name  
      @event = event
      @device_id = device_id
      @filter_type = filter_type
      @filter = filter
      @method = method
      @action = action
      @secret = secret
      @id = id  
    end 

    def save
      result = nil
      params = { name: @name, event: @event, device_id: @device_id, filter_type: @filter_type, filter: @filter, method: @method, action: @action, secret: @secret }.to_json

      response = API.post(API_ENDPOINT.chomp('/'), params)
      if response.code == '200'
        res = JSON.parse(response.body)
        @name = res['name']
        @device_id = res['device_id']  
        @event = res['event']  
        @filter_type = res['filter_type']  
        @filter = res['filter']
        @method = res['method']
        @action = res['action']
        @secret = res['secret']
        result = self
      end

      result
    end

    def self.find(id)
      result = nil
      response = API.get(API_ENDPOINT, id)
      if response.code == '200'
        res = JSON.parse(response.body)
        result = Callback.new(res['name'], res['event'], res['device_id'], res['filter_type'], res['filter'], res['method'], res['action'], res['secret'], res['id'])
      end

      result
    end

    def self.all
      result = nil
      params = { filters: [] }.to_json
      response = API.post(API_ENDPOINT + 'search', params)
      if response.code == '200'
        res = JSON.parse(response.body)['results']
        converted_objects = []
        res.each do |obj|
          converted_objects << Callback.new(obj['name'], obj['event'], obj['device_id'], obj['filter_type'], obj['filter'], obj['method'], obj['action'], obj['secret'], obj['id'])
        end
        result = converted_objects
      end

      result
    end

    def self.where(params)
      result = nil
      search_params = []
      tokens = params.split('AND')
      tokens.each do |tkn|
        tkn = tkn.split('=')
        params = { field: tkn[0].strip!, operator: '=', value: tkn[1].delete("'").strip!}
        search_params << params
      end

      params = { filters: [ search_params ], order_by: [ { field: 'created_at', direction: 'desc'}, limit: 5, offset: 5]  }.to_json
      response = API.post(API_ENDPOINT + 'search', params)
      if response.code == '200'
        res = JSON.parse(response.body)['results']
        converted_objects = []
        res.each do |obj|
          converted_objects << Callback.new(obj['name'], obj['event'], obj['device_id'], obj['filter_type'], obj['filter'], obj['method'], obj['action'], obj['secret'], obj['id'])
        end
        result = converted_objects
      end

      result
    end

    def update
      result = nil
      params = { name: @name, event: @event, device_id: @device_id, filter_type: @filter_type, filter: @filter, method: @method, action: @action, secret: @secret }.to_json

      response = API.put(API_ENDPOINT + "#{@id}", params)
      if response.code == '200'
        res = JSON.parse(response.body)
        @name = res['name']
        @device_id = res['device_id']  
        @event = res['event']  
        @filter_type = res['filter_type']  
        @filter = res['filter']
        @method = res['method']
        @action = res['action']
        @secret = res['secret']
        result = self
      end

      result
    end
  end
end