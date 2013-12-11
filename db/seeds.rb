# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

user1 = User.create!({
  email: "test@test.ca",
  first_name: "test",
  last_name: "test",
  city: "Edmonton",
  postal_code: "T6H 1K6",
  password: "test",
  password_confirmation: "test",
  bio: "Test was born in testland and grew up wanting to make an amazing kickstarter clone. Also the quick brown fox jumped over the lazy red dog.",
  genre_list: "rand, pi, sin, cosine",
  instrument_list: "bass,treble,midrange"
  }
)

user2 = User.create!({
  email: "dave@dave.ca",
  first_name: "dave",
  last_name: "dave",
  password: "dave",
  city: "Toronto",
  postal_code: "M5H 2N2",
  password_confirmation: "dave",
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
  postal_code: "M5H 2N2",
  password: "nothing",
  password_confirmation: "nothing",
  bio: "Nothing don't care. Nothing don't care about nothing at all. Quick dogs, lazy foxes, nothing matters to this guy.",
  genre_list: "rand, pi, sin, cosine",
  instrument_list: "truancy,hats,boots,tenor"
  }
)

