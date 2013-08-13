require 'spec_helper'

describe Key do
	let(:user) { FactoryGirl.create(:user) }
	before { @key = user.keys.build(name: "Test", description: "This is a test", is_public: false)}

	# before do
    # This code is not idiomatically correct.
    # @key = Key.new(name: "Test", description: "This is a test", user_id: user.id, is_public: false)    
  # end

  subject { @key }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:is_public) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
  	before { @key.user_id = nil }
  	it { should_not be_valid }
  end

  describe "when name is blank" do
  	before { @key.name = nil }
  	it { should_not be_valid }
  end

end
