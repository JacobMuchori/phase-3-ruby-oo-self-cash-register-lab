class CashRegister
    attr_accessor :total, :discount, :goods, :sumprice

    def initialize(discount = 0)
        @total = 0.0
        @discount = discount
        @items = Array.new
        @sumprice = Array.new
    end


    def add_item(object, price, quantity = 1)
      quantity.times {@items << object}
      @sumprice << price*quantity
      self.total += price*quantity
    end

    def apply_discount
        percent_disc = (100 - self.discount)
        unless self.discount <= 0
            self.total = @total*percent_disc/100
            return "After the discount, the total comes to $#{self.total.to_i}."
        end
            return "There is no discount to apply."
    end

    def items
        @items
    end

    def void_last_transaction
        @items.delete(-1)
        self.total -= @sumprice.last
        @total
    end
end
