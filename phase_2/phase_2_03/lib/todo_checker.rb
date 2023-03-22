def todo_checker(string)
    split = string.split(" ")
    split.each do |word|
    if string.include?("TODO")
    return true
    else
    return false
    end
  end
end