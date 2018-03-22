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

