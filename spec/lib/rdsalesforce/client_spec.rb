require_relative '../../spec_helper'

describe RDSalesForce::Client  do
  let(:host) { "host_url" }
  let(:username) { "username" }
  let(:password) { "password" }

  before { @client = RDSalesForce::Client.new(host, username, password) }
  describe "attributes" do
    it "must have the host attribute" do
      expect(@client).to respond_to :host
    end
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
    it "must raise exception with one argument" do
      expect(lambda{ RDSalesForce::Client.new(host) }).to raise_error ArgumentError
    end
    it "must raise exception with two arguments" do
      expect(lambda{ RDSalesForce::Client.new(host, username) }).to raise_error ArgumentError
    end
    it "must instantiate with three arguments" do
      expect(@client).to be_a RDSalesForce::Client
    end
  end 
  describe "#salesforce_api" do
    before { @salesforce = @client.salesforce_api }
    it "must have the same url than salesforce client" do
      expect(@salesforce.options[:host]).to eq @client.host
    end
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