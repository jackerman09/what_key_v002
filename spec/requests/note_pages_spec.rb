require 'spec_helper'

describe "Note pages" do

  subject { page }

	describe "viewing notes" do
    let!(:note1) { FactoryGirl.create(:note) }
    let!(:note2) { FactoryGirl.create(:note) }

    describe "on the index page" do
      before { visit notes_path }
      
      it { should have_content(note1.name) }
      it { should have_content(note1.description) }
      it { should have_content(note2.name) }
      it { should have_content(note2.description) }
    end
  end
end
