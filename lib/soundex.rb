class Soundex
  attr_accessor :original
  attr_accessor :soundex

  def initialize input
    self.original = input
    
    process input if !input.nil? && input.length > 0
  end

  def remove_neighbors input
    text = input.dup
    text.gsub!(/[bfpv][hw]{0,1}[bfpv]/) { |m| m[0] }
    text.gsub!(/[cgjkqsxz][hw]{0,1}[cgjkqsxz]/) { |m| m[0] }
    text.gsub!(/[dt][hw]{0,1}[dt]/) { |m| m[0] }
    text.gsub!(/l[hw]{0,1}l/, 'l')
    text.gsub!(/[mn][hw]{0,1}[mn]/) { |m| m[0] }
    text.gsub!(/r[hw]{0,1}r/, 'r')
    text
  end

  def strip_vowels input
    input.gsub(/[aeiouyhw]/, '')
  end

  def to_numbers input
    text = input.dup
    text.gsub!(/[bfpv]/, '1')
    text.gsub!(/[cgjkqsxz]/, '2')
    text.gsub!(/[dt]/, '3')
    text.gsub!(/[l]/, '4')
    text.gsub!(/[mn]/, '5')
    text.gsub!(/r/, '6')
    text
  end

  def process input
    first_letter = input[0]
    input = input.downcase
    input = remove_neighbors(input)
    input = strip_vowels(input)

    input = input[1..-1] unless first_letter.downcase.match(/[aeiouyhw]/)
    input = to_numbers(input)
    
    soundex = first_letter + input
    soundex = soundex.ljust(4, '0')
    self.soundex = soundex[0..3]
  end

  def to_s
    self.soundex
  end
end
