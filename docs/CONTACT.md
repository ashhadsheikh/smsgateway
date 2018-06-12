# SMSGateway::Contact
SMSGateway.me contact object to create, update, find and list contacts from your application.
#### Properties
| Name | Type | description |
| ------ | ------ | -----|
| id | int | Unique ID of Contact | 
| name | string | Name of Contact |
| phone_numbers | array | Phone numbers associated with this contact |
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
#### Creating and saving C
```
contact = SMSGateway::Contact.new(name, phone_numbers)
contact.save
```
#### Finding Contact on server
```
contact = SMSGateway::Contact.find(contact_id)
```
#### Updating contact on server
```
contact = SMSGateway::Contact.find(contact_id)
contact.name = 'New Name'
contact.update
```
#### Fetching all Contacts on server
```
all_contacts = SMSGateway::Contact.all
```
#### Fetching Contacts based on search filters
```
all_contacts = SMSGateway::Message.where("name = '1234'")
```