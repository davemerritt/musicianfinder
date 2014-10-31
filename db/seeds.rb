# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all

postal_arr = ["M2L 1A5", "M3A 2A5", "M3N 1A5", "M4E 1D2", "M4L 2L7", "M4M 2L7", "M5C 3N6", "M4P 2L7", "M5L 2L7", "M6G 2L7"]
genre_arr = ['Rock', 'Paper', 'Scissors', 'Gecko', 'Fox']
instrument_arr = ['Drums', 'Guitar', 'Violin', 'Flute']

user1 = User.create!({
  email: "erich@welz.ca",
  first_name: "Erich",
  last_name: "Welz",
  city: "Toronto",
  postal_code: "M4K 2L7",
  password: "password",
  password_confirmation: "password",
  bio: "I'm interested predominately in string based instruments such as guitar and piano. I'd love to practice with others sometime",
  genre_list: "Ambient, Big Band, Ska",
  instrument_list: "Guitar, Piano, Voice(tenor)",
  looking_for: "I am looking for people for people to sing with.",
  personal_url: "http://welz.ca"
  }
)

user2 = User.create!({
  email: "dave@gmail.com",
  first_name: "dave",
  last_name: "merritt",
  password: "password",
  password_confirmation: "password",
  city: "Toronto",
  postal_code: "M5H 2N2",
  bio: "I enjoy the sound of staple guns",
  genre_list: "Prog, Metal, Instrumental",
  instrument_list:"Guitar, Bass, Drums",
  looking_for: "I am looking for people to jam with for writing, performing, and potentially recording purposes.",
  personal_url: "http://homebass.ca"
  }
)

38.times do |i|
  User.create!({
  email: "person#{i}@gmail.com",
  first_name: "generic",
  last_name: "person##{i}",
  city: "Toronto",
  postal_code: postal_arr.sample,
  password: "password",
  password_confirmation: "password",
  bio: Faker::Lorem.sentence(word_count = 20),
  genre_list: genre_arr.sample(rand(1..3)),
  instrument_list: instrument_arr.sample(rand(1..3)),
  looking_for: Faker::Lorem.sentence(word_count = 20),
  personal_url: "http://homebass.ca"
  }
)
end

msg1 = user1.invitations.build(content: "Welcome to homebass, signed the admin", user_id: user1.id, recipient_id: user2.id)
msg1.save

msg2 = user2.invitations.build(content: "Thanks admin, hope all is well", user_id: user2.id, recipient_id: user1.id)
msg2.save
