class BookInStock
  attr_accessor :isbn, :price

  def initialize(isbn, price)
    raise "ArgumentError" if isbn.length == 0 || price < 0
    @isbn = isbn
    @price = price
  end

  def price_as_string
    ans = "$" << @price.to_s
    little_digits = ans.length - ans.index('.') - 1
    until little_digits == 2 do
      ans << '0'
      little_digits += 1
    end
    return ans
  end
end
