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

  option3<-function(){
    cat("There are multiple functions that help your ggSimple experience:",
        "Show_Variables():             Outputs a list of Available Columns with their data type",
        "Show_Scales():                Outputs a descriptive list of available Scale choices for
                              Continuous and Discrete axis",
        "Show_Themes():                Outputs a list of available themes, and a grid of Plots
                              showcasing those themes.",
        "is_(x/y)_scale_continuous():  Boolean Function that outputs true if x/y scale is continuous
                              or not",
        "Group_Count():                Outputs the number of groups available form the specified
                              group option in the plot",
        "\n",
        "All helper functions must come after the Plot() call, and most will need to come after a
plot object function such as Line()."
        ,sep="\n")
  }

  option4<-function(){
    cat("If there is a feature that is in keeping with the basic style of ggSimple that you think
should be included, either make a pull request or email me at andrewjameshaynes@gmail.com.")
  }

  if(option == 1){
    option1()
  }

  if(option == 2){
    option2()
  }

  if(option == 3){
    option3()
  }

  if(option == 4){
    option4()
  }

}




