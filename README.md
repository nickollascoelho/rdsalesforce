[![Coverage Status](https://coveralls.io/repos/nickollascoelho/rdsalesforce/badge.png?branch=master)](https://coveralls.io/r/nickollascoelho/rdsalesforce?branch=master)
[![Build Status](https://travis-ci.org/nickollascoelho/rdsalesforce.png?branch=master)](https://travis-ci.org/nickollascoelho/rdsalesforce)

# RDSalesForce

RDSalesForce is a ruby gem for save a Person as a Lead in Salesforce.

It uses the [restforce](https://github.com/ejholmes/restforce) gem to work with the [Salesforce REST api](http://www.salesforce.com/us/developer/docs/api_rest/index.htm).

## Installation

Add this line to your application's Gemfile:

    gem 'rdsalesforce', :git => 'git://github.com/nickollascoelho/rdsalesforce.git'

And then execute:

    $ bundle

## Usage

Create a RDSalesForce::Client object

  params = {
                'host' => 'url.salesforce.com',  
                'username' => 'myUsername', 
                'password' => 'myPassword' 
                'client_id' => 'myClientId000111',
                'client_secret' => 'myClientSecretXXXX000111',
                'security_token' => 'mySecurityTokenXXX9999111DDD'
            }
            
  @client = RDSalesForce::Client.new(params)

Create a RDSalesForce::Person object

  person_parameters = { 
     :name => "Name",
     :last_name => "LastName",
     :email => "myemail@mycompany.com",
     :company => "MyCompany",
     :job_title => "MyJobTitle",
     :phone => '+55000111222333',
     :website => "www.mycompany.com"
  } 
  
  @person = @client.create_person(person_parameters)

Save the object as your Salesforce lead

  @person.save_as_salesforce_lead


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
