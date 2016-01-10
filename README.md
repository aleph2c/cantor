# The Cantor function graphed using nyaplot

To get this working:

    > bundle install

    > guard

To use the Cantor class consider the following example:

    c = Cantor.new(100) # plot 100 locations in the cantor function
    c.plot              # create a graph called cantor_plot_101.html

# Notes
Ruby does not have good baked-in support for changing the bases of decimal
numbers.  To do this I used the flt library.

