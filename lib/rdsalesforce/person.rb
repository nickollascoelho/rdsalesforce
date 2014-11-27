module RDSalesForce
  class Person

    attr_accessor  :client, :name, :last_name, :email, :company, :job_title, :phone, :website

    def initialize(client, parameters={})
        raise ArgumentError,"client class must be RDSalesForce::Client" unless client.class == RDSalesForce::Client
        self.client = client
        parameters.each do |key, val| 
          if self.respond_to? key
            send("#{key}=", val)
          end 
        end
    end
    
    def save_as_salesforce_lead
      salesforce = self.client.salesforce_api
      @contact = salesforce.create!('Lead', Name: self.name, Email: self.email, Title: self.job_title, Phone: self.phone, Website: self.website)
      return @contact
    end
  end	
end