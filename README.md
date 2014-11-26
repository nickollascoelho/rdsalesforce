# RDSalesForce

RDSalesForce is a ruby gem for save a Person as a Contact in Salesforce.
It uses the restforce gem to work with the [Salesforce REST api](http://www.salesforce.com/us/developer/docs/api_rest/index.htm).

## Installation

Add this line to your application's Gemfile:

    gem 'rdsalesforce', :git => 'git://github.com/nickollascoelho/rdsalesforce.git'

And then execute:

    $ bundle

## Usage

Create a RDSalesForce::Client object
  
  @client = RDSalesForce::Client.new('https://url.salesforce.com', 'username', 'password')

Create a RDSalesForce::Person object
  
  @person = @client.create_person(parameters)

Save the object as your Salesforce contact

  @person.save_as_salesforce_contact

This is an example of RDSalesForce::Person parameters 

parameters = { 
  :name => "Name",
  :last_name => "LastName",
  :email => "myemail@mycompany.com",
  :company => "MyCompany",
  :job_title => "MyJobTitle",
  :phone => '+55000111222333',
  :website => "www.mycompany.com"
} 


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request