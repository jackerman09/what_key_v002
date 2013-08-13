FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
  
  factory :key do
  	sequence(:name)  { |n| "Key #{n}" }
  	sequence(:description)  { |n| "This is key #{n}" }
  	is_public false
  	user
  end

  factory :chord do
    sequence(:name) { |n| "Chord #{n}" }
    sequence(:description)  { |n| "This is chord #{n}" }
    is_public false
    user
  end
end

FactoryGirl.define do
  factory :note do
    sequence(:name) { |n| "Note #{n}" }
    sequence(:description)  { |n| "This is note #{n}" }
  end
end