# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
MessageScript.find_or_create_by(title: "Groundhog Day",
   body: "Did you know that today is Groundhog Day? Mostly this is just a reminding to watch the movie Groundhog Day.",
   original: true)

MessageScript.find_or_create_by(title: "Happy St. Patty’s Day -- Good one",
   body: "Happy St. Patty’s Day! I hope it’s a good one!",
   original: true)
MessageScript.find_or_create_by(title: "Happy St. Patrick’s Day -- not too good a time",
  body: "Hey, happy St. Patrick’s Day! Have a good time (but not too good a time, if you know what I mean)",
   original: true
  )
MessageScript.find_or_create_by(title: "Happy St Patrick’s Day -- Two tips",
  body: "Happy St Patrick’s Day! Two tips - wear green and tell your friends about me! ",
   original: true
  )

MessageScript.find_or_create_by(title: "Happy Easter!",
  body: "Happy Easter!",
   original: true
  )

MessageScript.find_or_create_by(title: "I hope you have a Happy Easter! -- appreciation",
  body: "I want you to know how much I appreciate your business. I hope you have a Happy Easter! ",
   original: true
  )

MessageScript.find_or_create_by(title: "Tax Day -- one week reminder",
  body: "Just a reminder that you only have one more week to get taxes filed. Let me know if you need any anything.",
   original: true
  )

MessageScript.find_or_create_by(title: "Tax Day -- look for a property",
  body: "One week to tax day. Let’s go look for an investment property so you can have a nice tax break for next year!",
   original: true
  )

MessageScript.find_or_create_by(title: "Closing Anniversary",
  body: "Can you believe it’s already been a year (or x years, if over one year) since you closed on your house! Time Flies!",
   original: true
  )

MessageScript.find_or_create_by(title: "It’s property tax time",
  body: "It’s property tax time - I just thought I’d check to see if you have any questions or if there is anything I can help you with. 
",
   original: true
  )

MessageScript.find_or_create_by(title: "Property taxes are due soon. Anything I can help with?",
  body: "Property taxes are due soon. Anything I can help with?",
   original: true
  )


  ## Add basic tags
  ['family', 'past clients', 'prospects'].each do |tag|
    ActsAsTaggableOn::Tag.find_or_create_by({name: tag, basic: true})
  end
  
  ##