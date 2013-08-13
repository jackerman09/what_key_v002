require 'spec_helper'

describe Chord do
  let(:user) { FactoryGirl.create(:user) }
	before { @chord = user.chords.build(name: "Test", description: "This is a test", is_public: false)}

  subject { @chord }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:is_public) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }
  # it { should respond_to(:add_note) }
  # it { should respond_to(:remove_note) }
  # it { should respond_to(:has_note) }

  it { should be_valid }

  describe "when user_id is not present" do
  	before { @chord.user_id = nil }
  	it { should_not be_valid }
  end

  describe "when name is blank" do
  	before { @chord.name = nil }
  	it { should_not be_valid }
  end
end
