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

Clear_Plot<-function(){
  remove(.PLOT)
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
    stop("You don't have a group= in your plot call! Use Colour() instead.")
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

# Fill<-function(fill){
#   for(i in 1:length(.PLOT$layers)){
#   .PLOT$layers[[i]]$aes_params$fill=fill
#   .PLOT$layers[[i]]$show.legend=F
#   }
# }

Colour<-function(colour){
  if(Group_Count() != 0){
    stop("You have a group= in your plot call! Use Group_Colours() instead.")
  }

  for(i in 1:length(.PLOT$layers)){
  .PLOT$layers[[i]]$aes_params$colour=colour
  .PLOT$layers[[i]]$aes_params$fill=colour
  .PLOT$layers[[i]]$show.legend=F
  }
}

Scales<-function(x="waiver",y="waiver", reorder_x_axis=NULL, reorder_y_axis=NULL){

  if(is_y_scale_continuos()){
   .PLOT <<- .PLOT + scale_y_continuous(labels=continuous_scale_options(y))
  } else {
    .PLOT <<- .PLOT + scale_y_discrete(labels=discrete_scale_options(y), limits = reorder_y_axis)
  }

  if(is_x_scale_continuos()){
    .PLOT <<- .PLOT + scale_x_continuous(labels=continuous_scale_options(x))
  } else {
    .PLOT <<- .PLOT + scale_x_discrete(labels=discrete_scale_options(x), limits = reorder_x_axis)
  }

}

Show_Scales<-function(){
  cat(
    "Continuous choices:",
    "Comma          - add commas to numbers >1000" ,
    "Dollar         - adds $ sign to values",
    "Pound          - adds £ sign to values",
    "Percent        - Multiply value by 100 and append with %",
    "Percent as is  - appends % to values",
    "Scientific     - prints value in sceitfic notation",
    "\n",
    "Discrete choices:",
    "Ordinal        - changes values to its ordinal equivalent",
    "Upper case     - changes all elements to upper case",
    "Lower case     - changes all elements to lower case",
    "Proper case    - upper cases only the first letter of every word",
    "Beautify       - Applies proper case to first word, then lower case to all others",
    sep="\n"
  )
}


