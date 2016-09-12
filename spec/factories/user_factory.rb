FactoryGirl.define do
	sequence(:email) { |n| "user#{n}@example.com" }
	sequence(:password) { |n| "user#{n}password" }

  factory :user do
    email
    password 
    first_name "Louis"
    last_name "Longin"
    admin false
  end

  factory :admin, class: User do
    email 
    password 
    first_name "Admin"
    last_name "User"
    admin true
  end

end
