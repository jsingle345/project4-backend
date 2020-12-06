# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Note.destroy_all 
Author.destroy_all 

Author.create(username: "First Author")
Author.create(username: "Creative Author")
Author.create(username: "Joshua")


Note.create(title: "First Note", content: "This is the content of the first note", author_id: Author.first.id)
Note.create(title: "Another Note", content: "Still I rise", author_id: Author.first.id)
Note.create(title: "My story", content: "I would like to share my story", author_id: Author.third.id)

