## No Group
no_group_test_plot<-function(){
Plot(iris)
Show_Variables()
Scatter("Sepal.Length", "Petal.Length")
Colour("Blue")
Labels(title = "My Test Plot")
Show_Plot()
}

## group test
group_test_plot<-function(){
Plot(iris)
Show_Variables()
Scatter("Sepal.Length", "Petal.Length", group = "Species")
Line("Sepal.Length", "Petal.Length", group = "Species")
Group_Colours(c("Orange", "Green", "Purple"))
Show_Scales()
Scales(x="scientific", y="pound")
Labels(title = "My Test Plot")
Show_Plot()
}

boxplot_test_plot<-function(){
Plot(iris)
Boxplot(x= "Species", y = "Sepal.Length")
Colour(colour = "Blue")
Labels(x_label = "My x-axis Label", y_label = "lower case y-axis label")
Scales(x = "upper case", y = "dollar")
Theme(theme = "Base R")
Show_Plot()
}
