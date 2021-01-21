FactoryBot.define do
  sequence :email do |n|
    "person#{n}@gifster.com"
  end

  factory :user do
    email
    password { 'password' }
  end
end
