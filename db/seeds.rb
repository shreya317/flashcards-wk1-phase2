User.destroy_all
Deck.destroy_all
Card.destroy_all
Turn.destroy_all

taha = User.create!(email: "taha@foo.com", password: "password")

class Parser
  attr_reader :lines, :hashes
  def initialize(filename)
    @lines = []
    @hashes = []
    File.open(filename, "r").each_line { |line| @lines << line.strip if line.strip != "" }
    create_card_hash
  end

  def create_card_hash
    @lines.each_index do |i|
      hash = {}
      if i % 2 == 1
       hash[:image_url] = @lines[i-1]
       hash[:answer] = @lines[i]
       @hashes << hash
      end
    end
  end

end

wild_animals = Deck.create!(name: "Wild Animals")
parser = Parser.new('db/fixtures/wild_animals.txt')
parser.hashes.each { |card_hash| wild_animals.cards << Card.create!(card_hash) }


hollywood_stars = Deck.create!(name: "Hollywood Stars")
parser = Parser.new('db/fixtures/hollywood_stars.txt')
parser.hashes.each { |card_hash| hollywood_stars.cards << Card.create(card_hash)}



