require "json"
require "pp"

$stdout.sync = true

$stdin.each do |line|
  str = line.chomp
  next unless str.length > 0
  begin
    obj = JSON.parse(str)
  rescue JSON::ParserError
    next
  end
  
  tweet = obj["text"]
  time = obj["created_at"]
  lan = obj["lang"]
  
  if lan == "en" 
    obj2 = obj["user"]
    username = obj2["name"]
    puts "*************************************************************************************************************"
    puts "User Name: #{username}"
    puts "Datetime: #{time}"
    puts "Tweet: #{tweet}"
    #puts "#{obj["user"]}"
    puts "***************************************************************************************************************"
    #puts "[#{time}] #{obj["id"]}"
  end
end
