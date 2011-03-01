Factory.define :user do |user|
  user.email { Faker::Internet.email }
  user.password "123123"
  user.password_confirmation { |u| u.password }
end
