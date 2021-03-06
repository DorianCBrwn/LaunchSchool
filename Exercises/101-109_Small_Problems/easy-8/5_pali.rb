def palindromes(string)
  ary = substrings(string).flatten
  p ary.select { |word| word.reverse == word && word.size > 1}
end


def substrings_at_start(string)
  string = string.gsub(/[^0-9a-z]/i,'').downcase
  result = []
  0.upto(string.size - 1).each do |index|
    result << string[0..index]
  end
  result
end

def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results << (substrings_at_start(this_substring))
  end
  results
end


palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]