require_relative '../../spec_helper'

describe RDSalesForce::Person do
  before(:each) {  @client = RDSalesForce::Client.new("host_url", "username", "pass")  }
  
  describe "initialize" do
    before { @person = RDSalesForce::Person.new(@client) }
    
    it "must raise an error when instantiate without arguments" do
      expect(lambda { RDSalesForce::Person.new }).to raise_error ArgumentError
    end
    
    it "must instantiate with at least an client argument" do
      expect(RDSalesForce::Person.new(@client)).to be_a RDSalesForce::Person
    end

    it "must raise an error when instantiate without an RDSalesForce::Client argument" do
      expect(lambda { RDSalesForce::Person.new("test") }).to raise_error ArgumentError
    end
  
  end
  describe "attributes" do
    
    before do 
      @attributes =  {
        name: "Name",
        last_name: "LastName",
        job_title: "Job",
        company: "Company",
        phone: "000111222333",
        email: "myname@mycompany.com",
        website: "www.mycompany.com"
      }
      @person = RDSalesForce::Person.new(@client, @attributes)
    end

    subject { @person }
    
    describe "attr_accessor" do
      it { should respond_to :attributes }
      it { should_not respond_to :name }
    end

    describe "attributes content" do
      specify { expect(@person.client).to be_a RDSalesForce::Client }
      specify { expect(@person.attributes[:name]).to eq @attributes[:name]}
      specify { expect(@person.attributes[:last_name]).to eq @attributes[:last_name]}
      specify { expect(@person.attributes[:job_title]).to eq @attributes[:job_title]}
      specify { expect(@person.attributes[:company]).to eq @attributes[:company]}
      specify { expect(@person.attributes[:phone]).to eq @attributes[:phone]}
      specify { expect(@person.attributes[:email]).to eq @attributes[:email]}
      specify { expect(@person.attributes[:website]).to eq @attributes[:website]}
    end
  end
end