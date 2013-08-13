require 'spec_helper'

describe Note do
  
	before { @note = Note.new(name: "Test", description: "This is a test")}

  subject { @note }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:noteinchords) }

  it { should be_valid }


  describe "when name is blank" do
  	before { @note.name = nil }
  	it { should_not be_valid }
  end

  describe "when description is blank" do
  	before { @note.description = nil }
  	it { should_not be_valid }
  end
end
