require 'factory_bot_rails'

user = FactoryBot.create(:user)
30.times do
  FactoryBot.create(:post, body: Faker::Lorem.unique.paragraph_by_chars(number: rand(1..140)), user:)
end
