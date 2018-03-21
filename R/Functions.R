require(ggplot2)

##: initialise plot object with data
Plot<-function(data){
  .PLOT<<-ggplot(data)
}

##: Show Variables available to the user
Show_Variables<-function(){
  cat("Available Columns are: \n",
      paste(colnames(iris), sapply(.PLOT$data, class), sep = ":   "),
      sep = "\n")
}

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

##: Output a plot
Show_Plot<-function(){
  print(.PLOT)
}

##: labels - will be default convert your x/y columns into a nice format

Labels<-function(x_label = waiver(), y_label = waiver(), title=waiver()){
  .PLOT$labels <- lapply(.PLOT$labels, goodLabelNames)
  .PLOT <<- .PLOT + xlab(x_label) + ylab(y_label) + ggtitle(title)
}

Group_Count<-function(){
  if((!is.null(.PLOT$labels$colour)) & isTRUE(.PLOT$labels$colour!="NULL" )){
    return(length(unique(.PLOT$data[,.PLOT$labels$colour])))
  } else if ((!is.null(.PLOT$labels$fill)) & isTRUE(.PLOT$labels$fill!="NULL")){
    return(length(unique(.PLOT$data[,.PLOT$labels$fill])))
  } else {
    return(0)
  }
}

##: set group colours, input should be vector same size as the number of groups
##:                    if no input is entered BUt there is a group, scan will ask for user input
Group_Colours<-function(input=NULL){
  how_many_groups = Group_Count()
  if(how_many_groups == 0){
    stop("You don't have a group in your plot call!")
  }

  if((!is.null(input)) & length(input) != how_many_groups){
    stop("Input vector is different size to size of group!")
  }

  if(is.null(input) & how_many_groups > 0){
  input =  scan("",paste0("Your plot call has ",how_many_groups, " groups, input a colour for each one:"), quiet = T, nmax = how_many_groups)
  }

  .PLOT <<- .PLOT + scale_color_manual(values = input) +
    scale_fill_manual(values = input)

}
