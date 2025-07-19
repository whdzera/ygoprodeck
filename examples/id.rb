require "ygoprodeck"

yugi = Ygoprodeck::ID.is("1121313")

case
when yugi == nil
  puts "Card not found"
else
  puts yugi # => get all information of dark magician (name,id,level,attr,atk,def,etc)

  puts "#" * 10

  # => get specific information of dark magician
  puts yugi["id"]
  puts yugi["name"]
  puts yugi["attribute"]
  puts yugi["type"]
  puts yugi["race"]
  puts yugi["level"]
  puts yugi["desc"]
  puts yugi["atk"]
  puts yugi["def"]
  puts Ygoprodeck::Image.is(yugi["id"]) # => use id from yugi['id'] to get dark magician image
  puts Ygoprodeck::Image_small.is(yugi["id"]) # => small version
end
