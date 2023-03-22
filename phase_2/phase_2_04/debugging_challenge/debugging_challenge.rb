def get_most_common_letter(text)
    text_without_whitespace = text.gsub(/\s+/, "")
    counter = Hash.new(0)
    text_without_whitespace.chars.each do |char|
      counter[char] += 1
    end
   counter.to_a.sort_by { |k, v| v }[-1][0]
  end
  
  # Intended output:
  # 
p get_most_common_letter("the roof, the roof, the roof is on fire!")
  # => "o"
  