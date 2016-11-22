# basic plots

# 1.

plot(presidents, type="b", cex=0.2, pch=8,
     main = "US President approval rating",
     sub = "1945-1974", col="blue")
abline(v = c(1953,1961,1964.9,1969,1974.7),col="red", lty=2)
abline(h = 50, col="darkgreen", lty=6)
text(x = c(1945,1953,1961,1964.9,1969)+1, y = 30, cex = 0.7,
     labels = c("Truman", "Eisenhower", "Kennedy", "Johnson", "Nixon")) 

# 2.

par(mfrow = c(1,2))
# Boxplot of normal and lognormal distributions
boxplot(rnorm(50),rnorm(100),rlnorm(100),
        names=c("small\nnormal","big\nnormal","log-normal"),
        col=grey(c(0.9, 0.6, 0.2)),border = "black")
# histogram of normal distribution
hist(rnorm(1000), breaks = 50, density = 15, col="pink", border = "red")

# 3.

par(mfow = c(1,1))
# Titanic survival per class
barplot(Titanic[,,Age="Adult",Survived="Yes"],beside = T,col=rainbow(4))
legend("topright",legend = dimnames(Titanic)$Class, fill = rainbow(4))

# 4. lattice

library(lattice)
library(plyr)
cloud(Sepal.Length~Sepal.Width*Petal.Length,iris,pch=16,alpha=0.7,cex=1,groups=iris$Species)

cloud(Sepal.Length~Sepal.Width*Petal.Length,
      iris,pch=16,alpha=0.7,cex=1,groups=iris$Species,
      main="Iris Species",scales=list(arrows=FALSE,
                                      x=list(cex=0.9,tck=0.5,col="wheat3"),
                                      y=list(cex=0.9,tck=0.5,col="wheat3"),
                                      z=list(cex=0.9,tck=0.5,col="wheat3")),
      par.settings=list(box.3d=list(col="wheat1"),
                        par.xlab.text=list(cex=0.8,col="tan3"),
                        par.ylab.text=list(cex=0.8,col="tan3"),
                        par.zlab.text=list(cex=0.8,col="tan3",rot=90)),
      col=c("tan","goldenrod","brown"))
