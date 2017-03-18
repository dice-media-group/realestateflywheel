FactoryGirl.define do
  factory :message_template do
    
  end
  factory :broadcast do
    user nil
    roster nil
    message_body "MyText"
    message_title "MyString"
    message_script nil
  end
  factory :roster_contact do
    contact nil
    roster nil
  end

  factory :roster do
    title "MyString"
    user nil
  end
  factory :photo do
    image "MyString"
    description "MyText"
    contact nil
  end
  factory :milestone do
    contact nil
    date "2017-02-20"
    description "MyText"
  end
  factory :message do
    title "MyString"
    body "MyText"
    belongs_to ""
  end
  factory :message_script do
    title "MyString"
    body "MyText"
    belongs_to ""
  end
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
