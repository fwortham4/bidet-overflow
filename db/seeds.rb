User.create(user_name: "sohel", email: "sohel.bootwala@gmail.com", password: "password")

Question.create(title: "gummy worms", content: "i love them sooooo much", user_id: 1)

User.create(user_name: "billybob", email: "billy_bob@gmail.com", password: "password")

Comment.create(content: "gummy worms are fucking stupid", user_id: 2, commentable_id: 1, commentable_type: "Question")

Answer.create(content: "I think your love for gummy worms is legitamate", question_id: 1, user_id: 2)
