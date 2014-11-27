module RDSalesForce
  
  class Client
    require 'rdsalesforce/person'
    
    attr_accessor :host, :username, :password

    def initialize(host, username, password)
      self.host = host
      self.username = username
      self.password = password
    end

    def create_person(parameters=nil)
      Person.new(self, parameters)
    end

    def salesforce_api
      @salesforce = Restforce.new :username => self.username,
        :password => self.password,
        :host => self.host
      @salesforce.authenticate!
      return @salesforce;
    end
	end
end