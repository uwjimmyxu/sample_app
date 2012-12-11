FactoryGirl.define do
   factory :user do
      name  "Jane Doe"
      email "test@test.com"
      password "foobar"
      password_confirmation "foobar"
   end
end
