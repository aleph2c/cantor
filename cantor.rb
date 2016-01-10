require 'flt'
require 'nyaplot'
# To use this Class consider the following example:
# c = Cantor.new(100) # plot 100 locations in the cantor function
# c.plot              # create a graph called cantor_plot_101.html
class Cantor
  attr_accessor :domain
  attr_reader   :range
  attr_accessor :w
  Precision     = 10
  def initialize(items)
    @domain = []
    @range  = []
    items_in_domain = items - 1
    (0..items_in_domain).to_a.each do |x|
      @domain.push x/items_in_domain.to_f
    end

    # make it an empty array if there is nothing to work with
    @domain = [] if @domain.nil?
    @domain = [] if !@domain.empty? && @domain.first.nan?
    if @domain.empty? == false
      @domain.each do |x|
        y = to_cantor(x)
        if y > 1.0
          y = 0
        end
        @range.push y
      end
    end
    @w      = nil
  end

  def plot
    plot = Nyaplot::Plot.new
    sc = plot.add(:scatter, domain, range)
    plot.x_label("cantor domain")
    plot.y_label("cantor range")
    color = Nyaplot::Colors.qual
    sc.color(color)
    sc.shape(["circle"])
    plot.export_html("cantor_plot_%s.html" % @domain.size )
  end

  def to_b_3(n)
    o = n.to_s
    o += '0' * Precision if o.count(".") == 1
    m = Flt::Num[3][o].to_s(base:3)
    m.to_s
  end

  def b_to_10(n)
    o  = n.to_s
    o += '0' * Precision if o.count(".") == 1
    Flt.BinNum(o,base:2).to_s(base:10).to_f
  end

  def replace_all_digits_after_first_1_with_zero(n)
    m = n.to_s
    o = ""
    decimal_found   = false
    first_one_found = false
    change_to_zero  = false
    m.each_char do |c|

      if c == "."
        decimal_found = true 
      end

      if c == "1" && decimal_found && !first_one_found
        first_one_found = true
      elsif decimal_found && first_one_found
        change_to_zero = true
      end

      o += ( change_to_zero ) ? '0' : c 
    end

    o
  end

  def replace_all_2s_with_1s(n)
    m = n.to_s
    o = ""
    m.each_char do |c|
      o += ( c == '2' ) ? '1' : c
    end
    o
  end
  # Takes a value between 0 and 1 and converts it to the cantor number
  def to_cantor(n)
    o = to_b_3(n)
    o = replace_all_digits_after_first_1_with_zero(o)
    o = replace_all_2s_with_1s(o)
    o = b_to_10(o)
    o.to_f
  end
end

