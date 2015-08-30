
game = Game.create(name: "Concentration", turn: 0)
deck = Deck.create(game: game)

suits = { 1 => "hearts", 2 => "diamonds", 3 => "spades", 4 => "clubs" }
faces = { 1 => "A", 11 => "J", 12 => "Q", 13 => "K" }

i = 1
while i < 5
  (1..13).each do |n|
    Card.create(deck: deck, value: n, suit: suits[i], matched: false, face: faces[n] ? faces[n] : "#{n}")
  end
  i += 1
end
