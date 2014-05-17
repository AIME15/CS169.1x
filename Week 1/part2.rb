def hello(name)
  return "Hello, " << name
end

def starts_with_consonant?(s)
  if s.length == 0
    return false
  end
  return s[0].downcase =~ /[[:lower:]]/ && !(s[0].downcase =~ /[aeiou]/)
end

def binary_multiple_of_4?(s)
  if s.length == 0
    return false
  end
  s.each_char do |elt|
    if elt != '0' && elt != '1'
      return false
    end
  end
  s.reverse!
  until s.length >= 2 do
    s << '0'
  end
  return s[0] == '0' && s[1] == '0'
end


=begin
puts hello("Eugene")
puts starts_with_consonant?("Eugene")
puts binary_multiple_of_4?("010101")
=end
