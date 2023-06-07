puts "🌱 Seeding spices..."

# Seed your database here

User.create(first_name: 'Epharus', last_name: 'Ndumia', user_name: 'EphN', password: '12345', email: 'epharus@example.com')
User.create(first_name: 'Bliss', last_name: 'Maake', user_name: 'BlsM', password: '32465', email: 'bliss@example.com')
User.create(first_name: 'Samuel', last_name: 'Karanja', user_name: 'SamK', password: '64875', email: 'samuel@example.com')
User.create(first_name: 'George', last_name: 'Samuel', user_name: 'GeoS', password: '85783', email: 'george@example.com')
User.create(first_name: 'Mark', last_name: 'Wanjau', user_name: 'MarW', password: '56484', email: 'mark@example.com')


Article.create(category: 'Technology', author_name: 'Epharus Ndumia', title: 'Introduction to Ruby', body: 'Ruby is a dynamic, open-source programming language.', date: Date.today)
Article.create(category: 'Sports', author_name: 'Bliss Maake', title: 'Football Basics', body: 'Learn the basics of football and its rules.', date: Date.today)
Article.create(category: 'Food', author_name: 'Mark Wanjau', title: 'Delicious Recipes', body: 'Explore a collection of mouthwatering recipes.', date: Date.today)
Article.create(category: 'Travel', author_name: 'Samuel Karanja', title: 'Best Travel Destinations', body: 'Discover the best travel destinations around the world.', date: Date.today)
Article.create(category: 'Health', author_name: 'George Samuel', title: 'Tips for a Healthy Lifestyle', body: 'Learn how to maintain a healthy lifestyle.', date: Date.today)


Comment.create(comments: 'Great article!', user_id: 1, article_id: 1)
Comment.create(comments: 'I found this very helpful.', user_id: 2, article_id: 1)
Comment.create(comments: 'Looking forward to trying these recipes!', user_id: 3, article_id: 3)
Comment.create(comments: 'Nice list of travel destinations.', user_id: 4, article_id: 4)
Comment.create(comments: 'These tips are practical and easy to follow.', user_id: 5, article_id: 5)


Like.create(user_id: 1, article_id: 1, interaction_type: 'like')
Like.create(user_id: 2, article_id: 1, interaction_type: 'like')
Like.create(user_id: 3, article_id: 2, interaction_type: 'like')
Like.create(user_id: 4, article_id: 2, interaction_type: 'dislike')
Like.create(user_id: 5, article_id: 2, interaction_type: 'like')
Like.create(user_id: 1, article_id: 3, interaction_type: 'like')
Like.create(user_id: 2, article_id: 4, interaction_type: 'like')
Like.create(user_id: 3, article_id: 5, interaction_type: 'like')
Like.create(user_id: 4, article_id: 5, interaction_type: 'dislike')
Like.create(user_id: 5, article_id: 5, interaction_type: 'like')

puts "✅ Done seeding!"
