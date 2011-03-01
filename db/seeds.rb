2.times do |i|
  User.create :name => "Test User #{i}",
    :email => "test#{i}@example.com",
    :password => "123123",
    :password_confirmation => "123123"
end

@staff1 = User.first

20.times do
  @ticket = Ticket.create do |ticket|
    ticket.name = Faker::Name.name
    ticket.email = Faker::Internet.email
    ticket.subject = Faker::Lorem.sentence
    ticket.body = Faker::Lorem.paragraph
    ticket.status_cd = rand(5)
  end
  5.times do 
    Reply.create do |reply|
      reply.body = Faker::Lorem.paragraph
      reply.ticket = @ticket
      reply.user = @staff1 if rand(2) > 1
    end
  end
end
