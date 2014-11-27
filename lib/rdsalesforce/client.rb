module RDSalesForce
  
  class Client
    require 'rdsalesforce/person'
    require 'openssl' 
    
    OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)

    attr_accessor :username, :password, :security_token, :client_id, :client_secret, :host

    def initialize(host, username, password)
      self.host = 'na16.salesforce.com'
      self.username = 'nickollascoelho@gmail.com'
      self.password = 'salesforce123'
      self.security_token = 'aL2CXA3jAu7H6jPoZIfFG1rNr'
      self.client_id      = '3MVG9fMtCkV6eLhfcGInOg5ML9H0SOqpNbd53dLHJsX62lWDfdPhZJ.L5KqDwLFABYRwif2pG7ppdNxZEsgVd'
      self.client_secret  = '849254060868716892'
    end

    def create_person(parameters=nil)
      Person.new(self, parameters)
    end

    def salesforce_api
      @salesforce = Restforce.new :username => self.username,
        :password => self.password,
        :security_token => self.security_token, 
        :client_id => self.client_id, 
        :client_secret => self.client_secret,
        :host => self.host
      @salesforce.authenticate!
      return @salesforce;
    end
	end
end