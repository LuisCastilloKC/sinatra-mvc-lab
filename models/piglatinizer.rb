require 'pry'

class PigLatinizer
  def piglatinize(sentence)
    pig_latin_sentence = []
    words = sentence.split

    words.each do |word|
      pig_latin_word = []

      word.split('').each.with_index do |letter, index|
        @check = []

        case letter 
        when /[oaeiuOAEIU]/
          if word.length > 1
            word.split('').each {|x| x.include?(letter) ? @check << letter : nil}
            pig_latin_word << letter
            
            if @check.length > 2
              first = word.split(letter).first
              match = word.split(letter)
              match.shift
              match.each {|x| pig_latin_word << "#{x}#{letter}"}
              pig_latin_word[-1] = word.split(letter).last
            elsif word[1].include?(letter)
              pig_latin_word << letter
              pig_latin_word << word.split(letter).last 
            else
              pig_latin_word << word.split(letter).last
            end

            if @check.length == 2 && !word[1].include?(letter)
              pig_latin_word << letter
            end

            pig_latin_word << word.split(letter).first
            pig_latin_word.join == word ? pig_latin_word << 'way' : pig_latin_word << 'ay'
            break
          else 
            pig_latin_word << letter
            pig_latin_word << 'way'
            break
          end
        end
      end

      if @check.length == 1 
        pig_latin_word.uniq!
      end 

      pig_latin_sentence << pig_latin_word.join
    end

    pig_latin_sentence.join(' ')
  end
end

x = PigLatinizer.new 
puts x.piglatinize('good')