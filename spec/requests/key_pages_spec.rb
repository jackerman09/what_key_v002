require 'spec_helper'

describe "Key pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "key creation" do
    before { visit user_path(user) }
    
    describe "with invalid information" do
      
      it "should not create a key" do
        expect { click_link "New Key" }.not_to change(Key, :count)
      end

      describe "error messages" do
        before do
        	click_link "New Key"
        	click_button "Add the Key"
        end
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do
      before do
      	click_link "New Key"
      	fill_in 'key_name',					with: "Test key"
      	fill_in 'key_description',	with: "Test description."
      end

      it "should create a key" do
        expect { click_button "Add the Key" }.to change(Key, :count).by(1)
      end
    end
  end

  describe "viewing keys" do
    let!(:key1) { FactoryGirl.create(:key, user: user) }
    let!(:key2) { FactoryGirl.create(:key, user: user) }

    describe "on the index page" do
      before { visit keys_path }
      
      it { should have_content(key1.name) }
      it { should have_content(key1.description) }
      it { should have_content(key2.name) }
      it { should have_content(key2.description) }
    end
    
    describe "on the show page" do
      before { visit key_path(key1) }

      it { should have_content(key1.name) }
      it { should have_content(key1.description) }
    end
  end

  # describe "key destruction" do
  #   before { FactoryGirl.create(:key, user: user) }
    
  #   describe "as correct user" do
  #     before { visit root_path }
      
  #     it "should delete a micropost" do
  #       expect { click_link "delete" }.to change(Micropost, :count).by(-1)
  #     end
  #   end
  # end
end