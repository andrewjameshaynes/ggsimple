upcaseFirstLetter = function(word, stopWords = c()){
  word = tolower(word)
  ifelse(!word %in% stopWords, paste0(toupper(substring(word,1,1)),substring(word,2)), word)
}

##: goodLabelNames() - Capitalises first letter in each word unless word is 3 or less letters in size, then leaves as is
goodLabelNames=function(string){
  string = gsub("\\.","_",string)
  words<-el(strsplit(string, split = "_"))
  for(i in 1:length(words)){
    index<-which(nchar(words)>3)
    if(i %in% index){
      words[i]<-paste0(toupper(substring(tolower(words[i]),1,1)),substring(tolower(words[i]),2))
    }
  }
  collapse<-function(x, sep =''){
    paste0(x,collapse=sep)
  }

  collapse(words, sep=' ')
}

is_x_scale_continuous<-function(){
  x_class = class(.PLOT$data[,as.character(el(.PLOT$layers)$mapping$x)])
  ifelse(x_class %in% c("numeric", "integer", "double"), T, F)
}
is_y_scale_continuous<-function(){
  y_class = class(.PLOT$data[,as.character(el(.PLOT$layers)$mapping$y)])
  ifelse(y_class %in% c("numeric", "integer", "double"), T, F)
}

continuous_scale_options<-function(scale_request){
    switch(gsub("[-_. ]+","",tolower(scale_request)),
           "comma" = comma,
           "dollar" = dollar,
           "pound" = {function(x){dollar_format(prefix = "£")}}(),
           "percent" = percent,
           "percentasis" = {function(x){paste0(comma(x),"%")}},
           "scientific" = scientific,
           "waiver" = waiver(),
           stop("oops! That's not an available scale. Call Show_Scales() for options."))
}

discrete_scale_options<-function(scale_request){
  switch(gsub("[-_. ]+","",tolower(scale_request)),
         "ordinal" = ordinal,
         "uppercase" = toupper,
         "lowercase" = tolower,
         "propercase" = upcaseFirstLetter,
         "beautify" = {function(x)sapply(x,goodLabelNames)},
         "waiver" = waiver(),
         stop("oops! That's not an available scale. Call Show_Scales() for options."))
}

is_histogram<-function(){
  ifelse(!(is.null(.PLOT$layers[[1]]$stat_params$bins)),T,F)
}
