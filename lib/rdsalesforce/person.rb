module RDSalesForce
  class Person
		#:name, :last_name, :email, :company, :job_title, :phone, :website,
    attr_accessor  :client, :attributes

    def initialize(client, parameters={})
        raise ArgumentError,"client class must be RDSalesForce::Client" unless client.class == RDSalesForce::Client
        self.client = client
        self.attributes = parameters
    end
    
    def save_as_salesforce_contact
      salesforce = self.client.salesforce_api
      @contact = salesforce.create('Contact', attributes)
      return @contact
    end
  end	
end