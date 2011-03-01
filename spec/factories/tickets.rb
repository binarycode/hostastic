Factory.define :ticket do |ticket|
  ticket.user { Factory :user }
  ticket.name { Faker::Name.name }
  ticket.email { Faker::Internet.email }
  ticket.subject { Faker::Lorem.sentence }
  ticket.body { Faker::Lorem.paragraph }
end
