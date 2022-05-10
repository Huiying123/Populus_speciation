library(RColorBrewer)
library(R.utils)
source("plotting_funcs.R") # here you need to add the path
par(mfrow=c(4,3))
for(edge in 0:10){
  plot_tree(cex=0.8,paste0(prefix,".",edge))
  title(paste(edge,"edges"))
}
for(edge in 0:10){
 plot_resid(stem=paste0(prefix,".",edge),pop_order="dogs.list")
}