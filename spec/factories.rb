FactoryGirl.define do
  factory :contact do
    first_name "MyString"
    last_name "MyString"
    email_address "MyText"
    street_one "MyText"
    street_two "MyText"
    city "MyString"
    state "MyString"
    zip "MyString"
    primary_phone "MyString"
    secondary_phone "MyString"
    addl_phone_one "MyString"
    addl_phone_two "MyString"
    lead_source "MyString"
  end
  factory :user do
    
  end
end
