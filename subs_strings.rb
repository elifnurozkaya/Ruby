 dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def sub_strings(string,array)
  words = string.downcase.split(" ")
  result = array.each_with_object(Hash.new(0)) do |d_word,hash|
    hash[d_word] += words.count(d_word) if words.include?(d_word)
    
  end
  puts result
end

 sub_strings("How do i go there?",dictionary)