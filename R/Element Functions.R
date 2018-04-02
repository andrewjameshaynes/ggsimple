
##: Scatter plot for x, y and a group to colour by
Scatter<-function(x, y, colour = NULL, group=NULL){
  .PLOT <<- .PLOT + geom_point(aes_string(x, y, col=group))
}

##: Bar plot for x, y, and a group to fill by
Bar<-function(x, y, colour = NULL, group=NULL){
  .PLOT <<- .PLOT + geom_col(aes_string(x, y, fill=group))
}

##: Bar plot for groups side-by-side
Side_By_Side_Bar<-function(x, y, colour = NULL, group=NULL){
  .PLOT <<- .PLOT + geom_col(aes_string(x, y, fill=group), position = "dodge")
}

##: Line plot for x/y and groups
Line<-function(x, y, group=NULL){
  .PLOT <<- .PLOT + geom_line(aes_string(x, y, col=group))
}

Histogram<-function(x, group = NULL, bins = 10){
  .PLOT <<- .PLOT + geom_histogram(aes_string(x, fill = group), bins = bins)
}

Boxplot<-function(x, y, group = NULL){
  if(class(.PLOT$data[,x]) %in% c("numeric", "integer", "double")){
    stop("This Boxplot function only allows discrete x values! Use Show_Variables() to see options.")
  }
  .PLOT <<- .PLOT + geom_boxplot(aes_string(x, y, fill = group))
}
