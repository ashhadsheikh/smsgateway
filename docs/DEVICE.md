# SMSGateway::Device
SMSGateway.me device object to look for your registered devices from your application.
#### Properties
| Name | Type | description |
| ------ | ------ | -----|
| id | int | Unique ID of Device| 
| name | string | Name of your registered Device |
| attributes | Hash | Hash to Contain attributes of your Device |
#### Class Methods
`.all`
`.where`
`.find`
### Usage
Gem is written to follow `ActiveRecord` way so in order to query objects on server, same practices will be followed:
#### Finding Device on server
```
device = SMSGateway::Device.find(device_id)
```
#### Fetching all Devices on server
```
all_devices = SMSGateway::Device.all
```
#### Fetching Devices based on search filters
```
all_devices = SMSGateway::Device.where("device_id = '1234' AND name = 'My Device'")
```
