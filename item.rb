class Item

attr_accessor :sales_tax, :import_tax, :shelf_price
attr_reader :quantity, :name

  def initialize(quantity, name, shelf_price, sales_tax, import_tax)
    @quantity = quantity
    @name = name
    @shelf_price = shelf_price
    @sales_tax = sales_tax
    @import_tax = import_tax
  end

  def tax
    sales_tax = 0.10
    import_tax = 0.05

    if @sales_tax == true && @import_tax == true
      @shelf_price * (sales_tax + import_tax)
    elsif @sales_tax == true && @import_tax == false
      @shelf_price + sales_tax
    elsif @sales_tax == false && @import_tax == true
      @shelf_price + import_tax
    elsif @sales_tax == false && @import_tax == false
      @shelf_price.round

    end
  end

  def total_price
    @shelf_price + tax
  end

end

class Receipt

    attr_accessor :items, :total, :total_sales_tax

    def initialize
      @items = []
      @total = 0
      @total_sales_tax = 0
    end

    def add(item)
      if item.is_a?(Item)
        @items << item
        @total_sales_tax += item.tax
        @total += item.total_price
      else
        "Not a class Item"
      end
    end

    def printout
    items.each do |item|
      p "#{item.quantity} #{item.name}: #{(item.shelf_price).round(2)}"
    end
      p "Sales Tax: #{(total_sales_tax).round(2)}"
      p "Total: #{(total).round(2)}"

  end
end


book = Item.new( 1, "book", 12.49, false, false )
music_cd = Item.new( 1, "music cd", 14.99, true, false)
chocolate_bar = Item.new( 1, "chocolate bar", 0.85, false, false)
box_of_chocolates = Item.new(1, "imported box of chocolate", 10.00, false, true)
imported_perfume = Item.new(1, "imported bottle of perfume", 47.50, true, true)
perfume = Item.new(1, "bottle of perfume", 20.89, true, false)
headache_pills = Item.new(1, "packet of headache pills", 9.75, false, false)

receipt1 = Receipt.new
receipt1.add(book)
receipt1.add(music_cd)
receipt1.add(chocolate_bar)
receipt1.printout

receipt2 = Receipt.new
receipt2.add(box_of_chocolates)
receipt2.add(imported_perfume)
receipt2.printout

receipt3 = Receipt.new
receipt3.add(perfume)
receipt3.add(box_of_chocolates)
receipt3.add(imported_perfume)
receipt3.add(headache_pills)
receipt3.printout
