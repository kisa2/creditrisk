# 5. feladat- Hitelportfóliók vintage modellje

# 0. Set as working directory

# a. Adatok betöltése "vintage_data.csv" fájlból

MyData <- read.csv(file="vintage_data.csv", header=TRUE, sep=",")

# b. L mátrix elõállítása a betöltött adat 2-7. oszlopaiból 

mymatrix <- as.matrix(MyData)
# mátrix létrehozása a c. feladathoz, segítség a plotoláshoz, az indexelés miatt
mymatrix[,-1]

# c. Különbözõ idõpontban induló állományok idõbeli alakulása

matplot(mymatrix[,-1], type="b", pch=15:20,col=c(1:6),axes=FALSE)

axis(2)
axis(1,1:45,mymatrix[,1])
names <-matrix(c( "0-3 months", "3-6 months", "6-9 months", "9-12 months" , "12-15 months", "15-18 month"), 6,1)

legend("bottomleft", inset= 0.01, legend=names, col=c(1:6), pch=15:20, bty="n", horiz=F)

# d.  az átlagos állomány méretét az egyes kohorszok esetén
mymatrix[,2]
for (i in 2:7){
  print (mean(as.numeric(mymatrix[,i]), na.rm=TRUE))
}

