library(ggplot2)
file=read.table("05.merge.pl.txt",header=T)
pdf("ld_decay_all.pdf")
head(file)
data_summary <- function(data, varname, groupnames){
  require(plyr)
  summary_func <- function(x, col){
    c(mean = mean(x[[col]], na.rm=TRUE),
      sd = sd(x[[col]], na.rm=TRUE))
  }
  data_sum<-ddply(data, groupnames, .fun=summary_func,
                  varname)
  data_sum <- rename(data_sum, c("mean" = varname))
  return(data_sum)
}

df2 <- data_summary(file, varname="r2", 
                    groupnames=c("pop", "dis"))
# Convert dose to a factor variable
df2$dis=as.factor(df2$dis)
head(df2)




ggplot(file,aes(dis,r2,color=pop))+geom_line()+geom_point(size=0.5)
dev.off()
