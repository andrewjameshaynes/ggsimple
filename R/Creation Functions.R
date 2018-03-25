##: initialise plot object with provided dataset
Plot<-function(data){
  .PLOT<<-ggplot(data) + theme_minimal()
}

##: Output the plot to window with minimal theme
Show_Plot<-function(){
  print(.PLOT)
}

##: Clear the plot object by removing .PLOT
Clear_Plot<-function(){
  remove(.PLOT, envir = .GlobalEnv)
}
