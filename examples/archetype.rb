require "ygoprodeck"

# kaiba is example, you free to change card name
kaiba = Ygoprodeck::Archetype.is("blue-eyes") # example I wanna search 'blue-eyes' archetype

# make for looping for listing archetype
kaiba_listing = [] # save listing here
count = 50 # count max listing . example 50
num_default = 0 # number default

# looping logic
for logic_search in 1..50
  if kaiba[num_default].nil?
  else
    kaiba_listing << kaiba[num_default]["name"]
    num_default += 1
    count -= 1
  end
end

puts "#{kaiba_listing.length} card matches for blue-eyes archetype" # length blue-eyes archetype
puts "#" * 30
puts "#{kaiba_listing.join(" \n")}" # each listing
