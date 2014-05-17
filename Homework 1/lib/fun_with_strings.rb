module FunWithStrings
  def palindrome?
    stripped = self.downcase.gsub(/[^[[:word:]]\s]/, '')
    stripped = stripped.gsub(/[ ]/, '')
    return stripped == stripped.reverse
  end
  def count_words
    hash = Hash.new(0)
    self.downcase.gsub(/[^[[:word:]]\s]/, '').split.each { |word| hash[word] += 1 }
    return hash
  end
  def anagram_groups
    return self.split.group_by { |word| word.chars.sort.join }.values
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
