library(ggplot2)
library(reshape2)
library(RColorBrewer)
library(MASS)
library(gtools)
colTrans <- function(col, f=2){
  hsv <- apply(col2rgb(col), 2, rgb2hsv)
  tmp <- logit(hsv[2,]*.9) - f
  hsv[2,] <- 1/(exp(-tmp) +1)
  tmp <- logit(hsv[3,]*.9) + f
  hsv[3,] <- 1/(exp(-tmp) +1)
  apply(hsv,2, function(x) hsv(x[1],x[2],x[3]))
}
rescale <- function(x) {
  log10(x+1)/2
}

#effects <- runif(18)
#names(effects) <- c("C>A","C>G","C>T","T>A","T>C","T>G","NN>NN","D","DI","I",
#                    "TD","DEL","INV","COMPLEX","TRSL","INTCHR","FOLDBACK","ALL")

myplot <- function(effects=E["N2",], gen="N2", mut="NA") {
  col <- c(brewer.pal(7, "Set1"), brewer.pal(8,'Dark2'), brewer.pal(5,"Pastel1"))
  par(mar=c(2,2,2,2))
  c <- t(effects)
  s <- stars(rescale(c), draw.segments=TRUE, col.segments=colTrans(col,f=0), scale=FALSE, col.lines=0, lty=0, labels="",
             locations=data.frame(Var1=1,Var2=1),
             main=paste("Mutational effects spectra of genotype ",gen," and mutagen ",mut, sep=""))
  for(k in c(0:round(log10( max(effects) )))){
    l = 10**k
    symbols(1, 1, circles=rescale(l), add=TRUE, inches=FALSE, fg="grey")
    text(1, 1 + rescale(l), l, cex=.5, col="grey")
  }
  text(s[,1],s[,2]-.5,paste(gen,":",mut,sep=""), pos=1,cex=0.7)
}









