# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

postal_arr = ["M2L 1A5", "M3A 2A5", "M3N 1A5", "M4E 1D2", "M4L 2L7", "M4M 2L7", "M5C 3N6", "M4P 2L7", "M5L 2L7", "M6G 2L7"]

user1 = User.create!({
  email: "test@test.ca",
  first_name: "test",
  last_name: "test",
  city: "Edmonton",
  postal_code: "T6H 1K6",
  password: "password",
  password_confirmation: "password",
  bio: "I'm interested predominately in string based instruments such as guitar and piano. I'd love to practice with others sometime",
  genre_list: "Ambient, Big Band, Ska",
  instrument_list: "Guitar, Piano, Voice(tenor)"
  }
)

user2 = User.create!({
  email: "dave@dave.ca",
  first_name: "dave",
  last_name: "dave",
  password: "password",
  password_confirmation: "password",
  city: "Toronto",
  postal_code: "M5H 2N2",
  bio: "Dave is known for maths. Also the quick brown fox jumped over the lazy red dog.",
  genre_list: "rand, pi, sin, cosine",
  instrument_list:"tenor,timbre,tautology"
  }
)

user3 = User.create!({
  email: "nothing@gmail.com",
  first_name: "nothing",
  last_name: "project",
  city: "Toronto",
  postal_code: "M4K 2L7",
  password: "password",
  password_confirmation: "password",
  bio: Faker::Lorem.sentence(word_count = 20),
  genre_list: "rand, pi, sin, cosine",
  instrument_list: "truancy,hats,boots,tenor"
  }
)

10.times do |i|
  User.create!({
  email: "nothing#{i}@gmail.com",
  first_name: "nothing#{i}",
  last_name: "project",
  city: "Toronto",
  postal_code: postal_arr.sample,
  password: "password",
  password_confirmation: "password",
  bio: Faker::Lorem.sentence(word_count = 20),
  genre_list: "rand, pi, sin, cosine",
  instrument_list: "tenor,guitar"
  }
)
end

