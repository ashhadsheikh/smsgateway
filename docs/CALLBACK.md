# SMSGateway::Callback
SMSGateway.me callback object to create, update, find and list callbacks from your application.
#### Properties
| Name | Type | description |
| ------ | ------ | -----|
| id | int | Unique ID of calback | 
| name | string | Name of callback |
| event | string | Event for callback |
| device_id | string | Device ID for which callback is being set |
| filter_type | string | Type of Filter |
| filter | string | Filter value |
| method | string | Method which need to be called |
| action | string | Action that needs to be taken |
| secret | string | Secret message |
#### Instance Methods
`.save`
`.update`
`.new`
#### Class Methods
`.all`
`.where`
`.find`
### Usage
Gem is written to follow `ActiveRecord` way so in order to query objects on server, same practices will be followed:
#### Creating and saving callback
```
callback = SMSGateway::Callback.new(name, event, device_id, filter_type, filter, method, action, secret)
callback.save
```
#### Finding Callback on server
```
callback = SMSGateway::Callback.find(callback_id)
```
#### Updating callback on server
```
callback = SMSGateway::Callback.find(callback_id)
callback.name = 'New Name'
callback.update
```
#### Fetching all Contacts on server
```
all_callbacks = SMSGateway::Callback.all
```
#### Fetching Callbacks based on search filters
```
all_callbacks = SMSGateway::Callback.where("name = 'new callback'")
```