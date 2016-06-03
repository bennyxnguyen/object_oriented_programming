# sales tax = 10% on everything except books, food, medical products
# additional 5% import duty on anything imported

class Cart

  def initialize
    @items = []
  end

  def add(item)
    @items << item
  end

end

class Item

  attr_reader :calculated_tax

  def initialize (name, shelf_price, sales_tax, import_tax)
    @name = name
    @shelf_price = shelf_price
    @sales_tax = sales_tax
    @import_tax = import_tax
    @calculated_tax = 0
  end

  def tax
    sale_tax = 0.10
    import_tax = 0.05

    if @sale_tax == true && @import_tax == true
      @calculated_tax = @shelf_price * (sale_tax + import_tax))

    elsif @sale_tax == true && @import_tax == false
      @calculated_tax = @shelf_price * (@shelf_price + sale_tax)

    elsif @sale_tax == false && @import_tax == true
      @calculated_tax = @shelf_price + import_tax

    elsif @sale_tax == false && @import_tax == false
      @calculated_tax
    end

    return @calculated_tax.round(2)
  end

  def total_price
    @shelf_price + tax
  end

end


book = Item.new("book", 12.49, false, false)
puts book.tax
music = Item.new("music", 16.49, true, false)
puts music.tax
imported_perfume = Item.new("imported_perfume", 32.19, true, true)
puts imported_perfume.tax

cart = Cart.new
cart.add(book)
cart.add(music)
cart.add(imported_perfume)

puts music.tax
puts music
