## No Group
Plot(iris)
Show_Variables()
Scatter("Sepal.Length", "Petal.Length")
Group_Colours()
Labels(title = "My Test Plot")
Show_Plot()

## group test
Plot(iris)
Show_Variables()
Scatter("Sepal.Length", "Petal.Length", group = "Species")
Group_Colours(c("Orange", "Green", "Purple"))
Labels(title = "My Test Plot")
Show_Plot()
