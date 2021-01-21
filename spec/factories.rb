FactoryBot.define do
  sequence :email do |n|
    "person#{n}@gifster.com"
  end

  factory :image do
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/images/test.png'), 'image/png') }
  end

  factory :user do
    email
    password { 'password' }
  end
end
