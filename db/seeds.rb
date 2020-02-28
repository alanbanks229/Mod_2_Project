# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
#   Examples:


#   Category.create (name: , description: )
category_data = [
    ["Programming/Coding", "A category dedicated to questions regarding coding languages."],
    ["Physics", "A category dedicated to questions regarding general physics"],
    ["Music", "A category dedicated to questions regarding general physics"],
    ["Video Games", "A category dedicated to questions regarding any Console or PC games"],
]
category_data.each do |row|
    Category.create(name: row[0], description: row[1])
end


#   Post.create     (user_id: , category_id: , title: , content: )
post_data = [
    [1, 1, "Ruby Enumerators/Code Blocks", "Hi my name is Alan, I am wondering what exactly happens in a code block such as Ruby's select method?"],
    [2, 2, "How Does Inertia Work?", "Hey y'all... VSauce here... What exactly is Inertai?"],
    [3, 3, "Trying to apply Secondary Dominants in my piece not working.", "To my music theory peeps. The song I am constructing is in D major. What are the best chords I should use in this key?"],
    [4, 4, "Tetris", "Sup I'm Wesley, who tryna play Battle Royale wit me?"],
]
post_data.each do |row|
    Post.create(user_id: row[0], category_id: row[1], title: row[2], content: row[3] )
end


#   User.create     (full_name: , user_name: , email: )
user_data = [
    ["Alan Banks", "abanks229", "banksgamerz229@gmail.com"],
    ["Michael", "VSauce", "vsauce@gmail.com"],
    ["Confused Musician", "Bob Doe", "help_me_wit_music@gmail.com"],
    ["Wesley Chen", "JuicyBlocBoi", "DaChen@gmail.com"]
]

user_data.each do |row|
    User.create(full_name: row[0], user_name: row[1], email: row[2])
end

#   Comment.create  (user_id: , post_id: , content: )
#   Reply.create    (user_id: , comment_id: , content: )
