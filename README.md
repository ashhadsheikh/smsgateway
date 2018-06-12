# smsgateway
A ruby gem to interact with smsgateway.me API which is most popular for sending messages via your android phone. 
## Getting Started
* **[Download The app from Play Store](https://play.google.com/store/apps/details?id=networked.solutions.sms.gateway.api&pcampaignid=MKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1)**
In order to turn your Android phone into a SMS Gateway you will need to download the app. The app allows you to communicate to your device using our API service. You can download the SMS Gateway API app free on the Android play store.
* **Sign Up for a free SMS Gateway account**
In order to use the SMS Gateway API service you will need to open your self an account with on SMSGateway.me. The account is completely free! You can register on the SMS Gateway API app or on [website](https://smsgateway.me/sms-api-documentation/getting-started).
* **Go to Web Portal and Copy your Authorization Token from SMSGateway.me portal**
* **Configure your application to include authorization token**
```ruby
# config/initializers/smsgateway.rb
SMSGateway.configure do |config|
  config.authorization_token = 'your_authorization_token_from_web_portal'
end
# or
SMSGateway.configuration.authorization_token = 'your_authorization_token_from_web_portal'
```

## Installation

Add this line to your application's Gemfile:

    gem 'smsgateway'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install smsgateway

## Usage and Reference
For complete usage instructions and configuration reference, see our individual object pages.
* [SMSGateway::Message](docs/MESSAGE.md)
* [SMSGateway::Device](docs/DEVICE.md)
* [SMSGateway::Callback](docs/CALLBACK.md)
* [SMSGateway::Contact](docs/CONTACT.md)
  
## Help / Support
If you run into any issues, please email us at [ashhadsheikh@hotmail.com](mailto:ashhadsheikh@hotmail.com)
For bug reports, please [open an issue on GitHub](https://github.com/ashhadsheikh/smsgateway/issues/new).
## Contributing
1. Fork it
2. Create your feature branch (```git checkout -b my-new-feature```).
3. Commit your changes (```git commit -am 'Added some feature'```)
4. Push to the branch (```git push origin my-new-feature```)
5. Create new Pull Request

## License
smsgateway is free software released under the MIT License. See [LICENSE.txt](LICENSE.txt) for details.