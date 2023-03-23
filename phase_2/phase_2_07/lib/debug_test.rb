
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
  
# "eo"

=begin

Before slice
@text = "aeiou"

After slice
@text = "eiou"

@text.slice(0,1) => ""
@text.slice(i+1..-1) => "iou"

ROUND 2

@text = "eiou"

After slice
@text = "eou" --> did not remove e but removed i

@text.slice(0,i) => e
@text.slice(i+1..-1) => u

=end