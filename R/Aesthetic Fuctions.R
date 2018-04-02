##: Set plot labels for x, y and title - by default will have blank title
##: and will use the beautified version of the columns names used for the plot
Labels<-function(x_label = waiver(), y_label = waiver(), title=waiver()){
  .PLOT$labels <- lapply(.PLOT$labels, goodLabelNames)
  .PLOT <<- .PLOT + xlab(x_label) + ylab(y_label) + ggtitle(title)
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

##: Colour/Fill all plot elements on a plot with no group
##: Will throw warning if you've specified a group earlier
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

## Add appropriate scales to a plot e.g scientific, comma, dollar
Scales<-function(x="waiver",y="waiver", reorder_x_axis=NULL, reorder_y_axis=NULL){
  if(is_histogram()==F){
    if(is_y_scale_continuous()){
      .PLOT <<- .PLOT + scale_y_continuous(labels=continuous_scale_options(y))
    } else {
      .PLOT <<- .PLOT + scale_y_discrete(labels=discrete_scale_options(y), limits = reorder_y_axis)
    }
  }

  if(is_x_scale_continuous()){
    .PLOT <<- .PLOT + scale_x_continuous(labels=continuous_scale_options(x))
  } else {
    .PLOT <<- .PLOT + scale_x_discrete(labels=discrete_scale_options(x), limits = reorder_x_axis)
  }

}

## Add a selected standard ggplot2/ggtheme to a plot
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
