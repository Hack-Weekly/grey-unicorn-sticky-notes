# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Create an array of sample sticky notes
sample_sticky_notes = [
  { content: 'Milk, eggs, bread, and fruits.', whiteboard_id: 1, color: '#f2f551', due_date: '2023-07-30', pinned: false, active: true, owner_id: 1, owner_type: 'User' },
  { content: 'Discuss project requirements and deadlines.', whiteboard_id: 2, color: '#c5f0c2', due_date: '2023-08-05', pinned: true, active: true, owner_id: 1, owner_type: 'User' },
  { content: 'Find and book flights for the upcoming vacation.', whiteboard_id: 1, color: '#d597f7', due_date: '2023-08-10', pinned: false, active: true, owner_id: 1, owner_type: 'User' },
  { content: 'Review chapters 1 to 5 for the upcoming tests.', whiteboard_id: 3, color: '#f3b9eb', due_date: '2023-07-29', pinned: true, active: true, owner_id: 1, owner_type: 'User' },
  { content: 'Leg day workout and cardio for 30 minutes.', whiteboard_id: 2, color: '#97eaf6', due_date: '2023-08-01', pinned: false, active: true, owner_id: 1, owner_type: 'User' },
  { content: 'Choose a topic and draft the blog post.', whiteboard_id: 1, color: '#eda39b', due_date: '2023-08-03', pinned: true, active: true, owner_id: 1, owner_type: 'User' },
  { content: 'Wish her a happy birthday and catch up.', whiteboard_id: 3, color: '#f3b9eb', due_date: '2023-07-27', pinned: false, active: true, owner_id: 1, owner_type: 'User' },
  { content: 'Call plumber or try to fix it yourself.', whiteboard_id: 2, color: '#d597f7', due_date: '2023-08-02', pinned: true, active: true, owner_id: 1, owner_type: 'User' },
  { content: 'Start reading "The Great Gatsby".', whiteboard_id: 1, color: '#c5f0c2', due_date: '2023-07-31', pinned: false, active: true, owner_id: 1, owner_type: 'User' }
]
[['', '#f2f551'], ['', '#c5f0c2'], ['', '#d597f7'], ['', '#f3b9eb'], ['', '#97eaf6'], ['', '#Eda39b']]
# Loop through the array and create sticky notes
sample_sticky_notes.each do |note|
  StickyNote.create!(note)
end

puts "Seed data for StickyNotes has been created."
