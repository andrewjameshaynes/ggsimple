HelpMe<-function(){
  option = readline(
    "What do you need help with?
    (Enter number for more guidance)
    1. How do I make a plot?
    2. What plot options are there?
    3. What helper functions are there?
    4. How do I request a new feature?

    I need help with: "
    )
  option1<-function(){
    ## How do I make a plot?
    cat("To make a plot you need to call the Plot() function with a dataset to intialise a plot object.",
        "E.g:",
        "Plot(iris) will create a plot base instance with the iris dataset.",
        "You can then add elements to your plot such as Bar() or Line()",
        "To output the plot to the window, you use Show_Plot().",
        sep="\n")
  }
  option2<-function(){
    cat("There are 6 types of plot that ggSimple supports:",
        "Scatter():          Produces a scatter plot of x vs y.",
        "Line():             Produces a line plot x vs y",
        "Bar():              Produces a barplot of x vs y",
        "Side_by_side_bar(): Produces a barplot of x vs y with bars within a group next to each other (position = 'dodge')",
        "Histogram():        Produces a Histogram of x with an option to set the number of bins (default = 10)",
        "Boxplot():          Produces a boxplot of x vs y. Note, will only except discrete values of x.",
        "\n",
        "All plots come with a 'group=' which allows you to colour the plot based on the values within a colour. The group option is then passed to subsequent functions."
        ,sep="\n")
  }

  if(option == 1){
    option1()
  }

  if(option == 2){
    option2()
  }

}




