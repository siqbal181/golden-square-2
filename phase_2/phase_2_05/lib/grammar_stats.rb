class GrammarStats
  def initialize
    @passed_checks = 0
    @total_checks = 0
  end

  def check(text) # text is a string
    fail "There is no valid string input." if text == ""
        @total_checks += 1
    if text.chars[0] == text.chars[0].upcase && text.chars[-1].match?(/[!.?]/)
        @passed_checks += 1
        return true
    else
        return false
    end
  end

  def percentage_good
    return (@passed_checks/@total_checks.to_f)*100.ceil
  end
end