require 'spec_helper'

describe "Note pages" do

  subject { page }

	describe "viewing notes" do
    let!(:note1) { FactoryGirl.create(:note) }
    let!(:note2) { FactoryGirl.create(:note) }

    describe "on the index page" do
      
      describe "for a non-signed in user" do
        before { visit notes_path }

        it { should have_content(note1.name) }
        it { should have_content(note1.description) }
        it { should have_content(note2.name) }
        it { should have_content(note2.description) }

        it { should_not have_content("New Note") }
      end

      describe "for a non-admin user" do
        let(:user) { FactoryGirl.create(:user) }
        before { sign_in user }
        before { visit notes_path }

        it { should have_content(note1.name) }
        it { should have_content(note1.description) }
        it { should have_content(note2.name) }
        it { should have_content(note2.description) }

        it { should_not have_content("New Note") }
      end

      describe "for an admin user" do
        let(:admin) { FactoryGirl.create(:admin) }
        before { sign_in admin }
        before { visit notes_path }

        it { should have_content(note1.name) }
        it { should have_content(note1.description) }
        it { should have_content(note2.name) }
        it { should have_content(note2.description) }

        it { should have_content("New Note") }
      end
    end
  end
end
