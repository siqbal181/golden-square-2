
@vowels = ["a", "e", "i", "o", "u"]
@text = "aeiou"
  
def remove_vowels()
      i = 0
      
      while i < @text.length()
        if @vowels.include? @text[i].downcase
          @text = @text.slice(0,i) + @text.slice(i+1..-1)
        else
            i += 1
        end
      end
      return @text
end

p remove_vowels()