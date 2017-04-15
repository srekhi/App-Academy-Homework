
# Write a method that translates a sentence into pig latin. You may want a helper method.
# 'apple' => 'appleay'
# 'pearl' => 'earlpay'
# 'quick' => 'ickquay'
require 'byebug'
def pig_latinify(sentence)
  sentence.split(" ").map { |word| pig_latinify_word(word) }.join(" ")
end

def pig_latinify_word(sentence)
  #debugger
  vowels = ["a", "e", "i", "o", "u"]
  #rules:
  #if vowel is first letter, keep and add ay
  #otherwise, remove first part until no longer a vowel
  #
  if vowels.include? (sentence[0])
    sentence << "ay"
  elsif sentence[0..1] == "qu"
    sentence = sentence[2...sentence.length] << "quay"
  else
    beg_consonant_count = count_beginning_consonants(sentence)
    sentence = sentence[beg_consonant_count..-1] + sentence.chars.take(beg_consonant_count).join("") + "ay"
    #keep removing until you find a vowel
  end
  sentence
end

def count_beginning_consonants(str)
  vowels = ["a", "e", "i", "o", "u"]
  count = 0
  prev_char = nil
  i = 0
  while i < str.length
    char = str[i]
    if char == "q" && char[i + 1] == "u"
      count += 2
      i += 2
    elsif !vowels.include? char
      count += 1
      i += 1
    elsif vowels.include? char
      break
    end
  end
  count
end
