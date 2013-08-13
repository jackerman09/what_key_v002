require 'spec_helper'

describe "Chord pages" do
  
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "chord creation" do
    before { visit user_path(user) }
    
    describe "with invalid information" do
      
      it "should not create a key" do
        expect { click_link "New Chord" }.not_to change(Chord, :count)
      end

      describe "error messages" do
        before do
        	click_link "New Chord"
        	click_button "Add the Chord"
        end
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do
      before do
      	click_link "New Chord"
      	fill_in 'chord_name',					with: "Test chord"
      	fill_in 'chord_description',	with: "Test description."
      end

      it "should create a chord" do
        expect { click_button "Add the Chord" }.to change(Chord, :count).by(1)
      end
    end
  end

  describe "viewing chords" do
    let!(:chord1) { FactoryGirl.create(:chord, user: user) }
    let!(:chord2) { FactoryGirl.create(:chord, user: user) }

    describe "on the index page" do
      before { visit chords_path }
      
      it { should have_content(chord1.name) }
      it { should have_content(chord1.description) }
      it { should have_content(chord2.name) }
      it { should have_content(chord2.description) }
    end
    
    describe "on the show page" do
      before { visit chord_path(chord1) }

      it { should have_content(chord1.name) }
      it { should have_content(chord1.description) }
    end
  end
end
