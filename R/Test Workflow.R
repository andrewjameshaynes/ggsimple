## No Group
no_group_test_plot<-function(){
Plot(iris)
Show_Variables()
Scatter("Sepal.Length", "Petal.Length")
Group_Colours()
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
