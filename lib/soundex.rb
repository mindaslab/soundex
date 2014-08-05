def soundex word
  text = word
  soundex = ""
  loop do
    text = text.downcase
    first_letter = text[0]
    other_letters = text[1..text.length]
    other_letters = other_letters.gsub /[aeiouyhw]/, ''
    other_letters = other_letters.gsub /[bfpv]/, '1'
    other_letters = other_letters.gsub /[cgjkqsxz]/, '2'
    other_letters = other_letters.gsub /[dt]/, '3'
    other_letters = other_letters.gsub /[i]/, '4'
    other_letters = other_letters.gsub /[mn]/, '5'
    other_letters = other_letters.gsub /r/, '6'
    (1..6).to_a.each do |num|
      other_letters = other_letters.gsub Regexp.new("#{num}+"), num.to_s
    end
    text = first_letter + other_letters
    break if text.match /\w\d+/
  end
  (text + "0000")[0..3]
end
