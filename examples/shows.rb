require 'bundler'
Bundler.setup(:default, :development)

require 'artsy_client'

Artsy::Client.authenticate!

Artsy::Client.shows(near: "40.72,-74.00", size: 3, status: :current, published_with_eligible_artworks: true).each do |show|
  puts "#{show.name} at #{show.partner.name}"
  show.artworks(size: 2).each do |artwork|
    puts "  #{artwork.title}, #{artwork.date}"
  end
end
