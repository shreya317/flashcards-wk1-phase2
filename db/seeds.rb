User.destroy_all
Deck.destroy_all
Card.destroy_all
Turn.destroy_all

taha = User.create!(email: "taha@foo.com", password: "password")

deck = Deck.create!(name: "Animals")


deck.cards.create!([{image_url: "www.bobcat.com", answer: "bobcat"},{image_url: "www.moose.com",answer: "moose"}, {image_url: "www.tahagatchi.com",answer: "Tahagatchi"}, {image_url: "www.koala.com",answer: "koala"}])


5.times{taha.played_cards << deck.cards.sample}

