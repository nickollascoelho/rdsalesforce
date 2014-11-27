require_relative '../../spec_helper'

describe RDSalesForce::Client  do
  let(:person) { {"host" => "host_url", "username" => "username", "password" => "password", "security_token" => "security_token", "client_id" => "client_id", "client_secret" => "client_secret"} }

  before { @client = RDSalesForce::Client.new(person) }
  describe "attributes" do
    it "must have the username attribute" do
      expect(@client).to respond_to :username
    end
    it "must have the password attribute" do
      expect(@client).to respond_to :password
    end
  end
  describe "#initialize" do
    
    it "must raise exception without arguments" do
      expect(lambda{ RDSalesForce::Client.new }).to raise_error ArgumentError
    end
    it "must instantiate with one argument" do
      expect(@client).to be_a RDSalesForce::Client
    end
  end 
  describe "#salesforce_api" do
    before { @salesforce = @client.salesforce_api }
    it "must have the same username than salesforce client" do
      expect(@salesforce.options[:username]).to eq @client.username
    end
    it "must have the same password than salesforce client" do
      expect(@salesforce.options[:password]).to eq @client.password
    end
  end

  describe "#create_person" do
    before { @person = @client.create_person({}) }
    it "must create a RDSalesForce::Person object" do
      expect(@person).to be_a RDSalesForce::Person
    end
    it "must have the @client as an attribute" do
      expect(@person.client).to eq @client
    end
  end

end