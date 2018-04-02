require(ggplot2)

##: Show Variables available to the user
Show_Variables<-function(){
  cat("Available Columns are: \n",
      paste(colnames(iris), sapply(.PLOT$data, class), sep = ":   "),
      sep = "\n")
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

Theme<-function(theme){
 THEME = switch(gsub("[-_. ]+","",tolower(theme)),
         "baser" = theme_base(),
         "bare" = theme_few(),
         "googledocs" = theme_gdocs(),
         "themegrey" = theme_grey(),
         "themegray" = theme_gray(),
         "empty" = theme_map(),
         "tufte" = theme_tufte(),
         "wallstreet" = theme_wsj(),
         "blackandwhite" = theme_bw(),
         stop("oops! That's not an available theme. Call Show_Themes() for options."))
  .PLOT <<- .PLOT + THEME
}


Show_Themes<-function(){
  label = c("Base R", "Bare", "Google Docs", "Grey", "Empty", "Tufte", "Wall Street", "Black and White")
  themes<-c(theme_base,theme_few,theme_gdocs,theme_grey,theme_map,theme_tufte,theme_wsj,theme_bw)

  p1 <- ggplot(iris) + geom_boxplot(aes(Species, Petal.Width, fill = Species)) + ggtitle(label[1]) + theme_base()
  p2 <- ggplot(iris) + geom_boxplot(aes(Species, Petal.Width, fill = Species)) + ggtitle(label[2]) + theme_few()
  p3 <- ggplot(iris) + geom_boxplot(aes(Species, Petal.Width, fill = Species)) + ggtitle(label[3]) + theme_gdocs()
  p4 <- ggplot(iris) + geom_boxplot(aes(Species, Petal.Width, fill = Species)) + ggtitle(label[4]) + theme_grey()
  p5 <- ggplot(iris) + geom_boxplot(aes(Species, Petal.Width, fill = Species)) + ggtitle(label[5]) + theme_map()
  p6 <- ggplot(iris) + geom_boxplot(aes(Species, Petal.Width, fill = Species)) + ggtitle(label[6]) + theme_tufte()
  p7 <- ggplot(iris) + geom_boxplot(aes(Species, Petal.Width, fill = Species)) + ggtitle(label[7]) + theme_wsj()
  p8 <- ggplot(iris) + geom_boxplot(aes(Species, Petal.Width, fill = Species)) + ggtitle(label[8]) + theme_bw()
  grid.arrange(p1, p2, p3, p4, p5, p6, p7, p8)

  cat("Available themes are:",label,sep = "\n")
  remove(p1, p2, p3, p4, p5, p6, p7, p8)
}



