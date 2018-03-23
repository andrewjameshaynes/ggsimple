HelpMe<-function(){
  option = readline(
    "What do you need help with?
    (Enter number for more guidance)
    1. How do I make a plot?
    2. How do I see what plot options there are?
    3. What helper functions are there?
    4. How do I request a new feature?
    
    I need help with: "
    )
  
  if(option == 1){
    cat("To make a plot you need to call the Plot() function with a dataset to intialise a plot object.",
        "E.g:",
        "Plot(iris) will create a plot base instance with the iris dataset.",
        "You can then add elements to your plot such as Bar() or Line()",
        "To output the plot to the window, you use Show_Plot().",
        sep="\n")
    
  }
  
}

##create option functions
