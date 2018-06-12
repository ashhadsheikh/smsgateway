# SMSGateway::Message
SMSGateway.me message object to create, send, find and cancel messages from your application.
#### Properties
| Name | Type | description |
| ------ | ------ | -----|
| id | int | Unique ID of SMS| 
| device_id | string | Device ID from which SMS will be sent. |
| phone_number | string | Phone number to which SMS will be sent. |
| message | string | SMS contents |
| status | string | current status of SMS |
| created_at  | string | Time at which request was sent to server |
| updated_at  | string | Last updated timestamp |
| log  | array | Complete history of this SMS lifecycle |
#### Instance Methods
`.send`
`.cancel`
`.new`
#### Class Methods
`.all`
`.where`
`.find`
### Usage
Gem is written to follow `ActiveRecord` way so in order to query objects on server, same practices will be followed:
#### Creating and sending  SMS
```
sms = SMSGateway::Message.new(from_device_id, to_phone_number, sms_text)
sms.send
```
#### Finding SMS on server
```
sms = SMSGateway::Message.find(message_id)
```
#### Cancelling SMS on server
```
sms = SMSGateway::Message.find(message_id)
sms.cancel
```
#### Fetching all SMS on server
```
all_sms = SMSGateway::Message.all
```
#### Fetching SMS based on search filters
```
all_sms = SMSGateway::Message.where("device_id = '1234' AND message = 'Hello, World!'")
```

