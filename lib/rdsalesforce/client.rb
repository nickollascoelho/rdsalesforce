module RDSalesForce
  
  class Client
    require 'rdsalesforce/person'
    require 'openssl' 
    

    ## Warning, vulnerable to man in the middle attack
    OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)

    attr_accessor :username, :password, :security_token, :client_id, :client_secret, :host, :salesforce_api

    #SAMPLE
    #self.host = 'na16.salesforce.com'
    #self.username = 'nickollascoelho@gmail.com'
    #self.password = 'salesforce123'
    #self.security_token = 'aL2CXA3jAu7H6jPoZIfFG1rNr'
    #self.client_id      = '3MVG9fMtCkV6eLhfcGInOg5ML9H0SOqpNbd53dLHJsX62lWDfdPhZJ.L5KqDwLFABYRwif2pG7ppdNxZEsgVd'
    #self.client_secret  = '849254060868716892'

    def initialize(params)
      self.host           = params[:host]
      self.username       = params[:username]
      self.password       = params[:password]
      self.security_token = params[:security_token]
      self.client_id      = params[:client_id]
      self.client_secret  = params[:client_secret]

      self.salesforce_api = Restforce.new :username => self.username,
        :password => self.password,
        :security_token => self.security_token, 
        :client_id => self.client_id, 
        :client_secret => self.client_secret,
        :host => self.host
    end

    def create_person(params=nil)
      Person.new(self, params)
    end
	end
end