# ggsimple - A Wrapper for ggplot2

A small package built on top of ggplot2 that provides very basic plotting functionality with easy and automatic plotting functions.

Inspired by Python and Julia style of plotting where a plot is created by a series of function calls.

Package consists of:

- **Creation functions**:
  These functions start a plot instance and show the final complete plot
  
- **Element functions**: 
  These create the actual plot elements, such as the points or a line
  
- **Aesthetic functions**: 
  These update the plot to have nice features such as different colours, or nice label names
  
- **Helper functions**: 
  These output helpful information that is useful when plotting, such as what columns are available with their types, or how many groups you have defined
