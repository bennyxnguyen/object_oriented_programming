# sales tax = 10% on everything except books, food, medical products
# additional 5% import duty on anything imported

class Cart

  def initialize
    @items = []
  end

  def add(item)
    #if item.is_a?(Item)
    @items << item
  end

end

class Item

  def initialize (name, shelf_price, sales_tax, import_tax)
    @name = name
    @shelf_price = shelf_price
    @sales_tax = sales_tax
    @import_tax = import_tax
  end

end


book = Item.new("book", 12.49, false, false)
music = Item.new("music", 16.49, true, false)
imported_perfume = Item.new("imported_perfume", 32.19, true, true)

cart = Cart.new

cart.add(book)
cart.add(music)
cart.add(imported_perfume)
