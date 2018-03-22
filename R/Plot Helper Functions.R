##: Cute wrapper for verbose collapse argument in paste0
collapse<-function(x, sep =''){
  paste0(x,collapse=sep)
}

##: goodLabelNames() - Capitalises first letter in each word unless word is 3 or less letters in size, then leaves as is
goodLabelNames=function(string){
  string = gsub("\\.","_",string)
  words<-el(strsplit(string, split = "_"))
  for(i in 1:length(words)){
    index<-which(nchar(words)>3)
    if(i %in% index){
      words[i]<-paste0(toupper(substring(words[i],1,1)),substring(words[i],2))
    }
  }
  collapse(words, sep=' ')
}

is_x_scale_continuos<-function(){
  x_class = class(.PLOT$data[,as.character(el(.PLOT$layers)$mapping$x)])
  ifelse(x_class %in% c("numeric", "integer", "double"), T, F)
}
is_y_scale_continuos<-function(){
  x_class = class(.PLOT$data[,as.character(el(.PLOT$layers)$mapping$y)])
  ifelse(x_class %in% c("numeric", "integer", "double"), T, F)
}

continuous_scale_options<-function(scale_request){
    switch(gsub("[-_. ]+","",tolower(scale_request)),
           "comma" = comma,
           "dollar" = dollar,
           "pound" = {function(x){dollar_format(prefix = "£")}}(),
           "percent" = percent,
           "percentasis" = {function(x){paste0(comma(x),"%")}},
           "scientific" = scientific,
           stop("oops! That's not an available scale. Call Show_Scales() for options."))
}

discrete_scale_options<-function(scale_request){
  switch(gsub("[-_. ]+","",tolower(scale_request)),
         "ordinal" = ordinal,
         "uppercase" = toupper,
         "lowercase" = tolower,
         "propercase" = upcaseFirstLetter,
         stop("oops! That's not an available scale. Call Show_Scales() for options."))
}
