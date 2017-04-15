FactoryGirl.define do

  sequence :email do |n|
    "person#{n}@example.com"
  end

  sequence :email_address do |n|
    "person#{n}@example.com"
  end

  sequence :first_name do |n|
    "first name#{n}"
  end

  sequence :last_name do |n|
    "last name#{n}"
  end

  sequence :primary_phone do |n|
    "555-444-121#{n}"
  end

 
  factory :message_template do
    
  end
  factory :broadcast do
    user nil
    message_body "Now is the time for all good men."
    message_title "Good Men"
    message_script nil
    tag_list ["mono", "tag"]
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
    first_name 
    last_name 
    email_address
    street_one "1 street"
    street_two "Apt 2"
    city "City"
    state "UT"
    zip "94044"
    primary_phone 
    primary_phone_kind "mobile"
    secondary_phone "455-555-1213"
    addl_phone_one "455-555-1214"
    addl_phone_two "455-555-1217"
    lead_source "455-555-1219"
    tag_list ["mono", "tag1"]
    
  end
  
  factory :user, :class => 'User' do
    email
    password '12345678'
    password_confirmation '12345678'
    
    # user_with_posts will create contact data after the user has been created
    factory :user_with_contacts do
      # contacts_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        contacts_count 5
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the contact
      after(:create) do |user, evaluator|
        create_list(:contact, evaluator.contacts_count, user: user)
      end
    end
    
  end
end
