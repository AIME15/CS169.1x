def hello(name)
  return "Hello, " << name
end

def starts_with_consonant?(s)
  if s.length == 0
    return false
  return s[0].downcase =~ /[[:lower:]]/ && !(s[0].downcase =~ /[aeiou]/
end

def binary_multiple_of_4?(s)
  s.each do |elt|
    if elt != 0 && elt != 1
      return false
    end
  end
  s.reverse!
  until s.length >= 2 do
    s.append('0')
  end
  return s[0] == '0' && s[1] == '0'
end
