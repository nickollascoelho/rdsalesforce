require_relative '../../spec_helper'

describe RDSalesForce::Person do
  let(:person) { {"host" => "host_url", "username" => "username", "password" => "password", "security_token" => "security_token", "client_id" => "client_id", "client_secret" => "client_secret"} }

  before(:each) {  @client = RDSalesForce::Client.new(person)  }
  
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
      it { should respond_to :client }
      it { should respond_to :name }
      it { should respond_to :last_name }
      it { should respond_to :job_title }
      it { should respond_to :company }
      it { should respond_to :phone }
      it { should respond_to :email }
      it { should respond_to :website }
      it { should_not respond_to :attributes }
    end

    describe "attributes content" do
      specify { expect(@person.client).to be_a RDSalesForce::Client }
      specify { expect(@person.name).to eq @attributes[:name]}
      specify { expect(@person.last_name).to eq @attributes[:last_name]}
      specify { expect(@person.job_title).to eq @attributes[:job_title]}
      specify { expect(@person.company).to eq @attributes[:company]}
      specify { expect(@person.phone).to eq @attributes[:phone]}
      specify { expect(@person.email).to eq @attributes[:email]}
      specify { expect(@person.website).to eq @attributes[:website]}
    end
  end
end