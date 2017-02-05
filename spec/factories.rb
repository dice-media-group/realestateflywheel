FactoryGirl.define do
  factory :contact do
    first_name "Firstname"
    last_name "LastName"
    email_address "email@email.com"
    street_one "1 street"
    street_two "Apt 2"
    city "City"
    state "UT"
    zip "94044"
    primary_phone "455-555-1212"
    secondary_phone "455-555-1213"
    addl_phone_one "455-555-1214"
    addl_phone_two "455-555-1217"
    lead_source "455-555-1219"
  end
  factory :user do
    
  end
end
