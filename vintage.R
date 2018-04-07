# 5. feladat- Hitelportfóliók vintage modellje / Készítették: Kis Anett (cw88f1), Varga Vivien()

# 0. Set as working directory

# a. Adatok betöltése "vintage_data.csv" fájlból

MyData <- read.csv(file="vintage_data.csv", header=TRUE, sep=",")

# b. L mátrix előállítása a betöltött adat 2-7. oszlopaiból 

mymatrix <- as.matrix(MyData)
# mátrix létrehozása a c. feladathoz, segítség a plotoláshoz, az indexelés miatt
mymatrix[,-1]

# c. Különböző időpontban induló állományok időbeli alakulása

matplot(mymatrix[,-1], type="b", pch=15:20,col=c(1:6),axes=FALSE)

axis(2)
axis(1,1:45,mymatrix[,1])
names <-matrix(c( "0-3 months", "3-6 months", "6-9 months", "9-12 months" , "12-15 months", "15 months < "), 6,1)

legend("bottomleft", inset= 0.01, legend=names, col=c(1:6), pch=15:20, bty="n", horiz=F)

# d.  Az átlagos állomány mérete az egyes kohorszok esetén

for (i in 2:7){
  print (mean(as.numeric(mymatrix[,i]), na.rm=TRUE))
}

#e. Határozza meg az egyes kohorszok legnagyobb elemét (Li) (eredmények lejárat szerinti sorrendben, 0-3 months, 3-6 months etc.)


for (i in 2:7){
  print (max(as.numeric(mymatrix[,i]), na.rm=TRUE))
}

#f. Számolja ki az adott kohorsz méretét a kezdő érték százalékában
    # kezdőértékek megkeresése for ciklussal
normalizedmatrix=mymatrix
for (i in 2:7){
  startervalue= (max(as.numeric(normalizedmatrix[,i]), na.rm=TRUE))
  for (j in 1:length(normalizedmatrix[,i])) {
    normalizedmatrix[j,i]=(as.numeric(normalizedmatrix[j,i])/ startervalue) 
  }
 

}

#g. Eredmények kirajzolása matplot segítségével

matplot(normalizedmatrix[,-1], type="b", pch=15:20,col=c(1:6),axes=FALSE)

axis(2)
axis(1,1:45,normalizedmatrix[,1])
names <-matrix(c( "0-3 months", "3-6 months", "6-9 months", "9-12 months" , "12-15 months", "15 months < "), 6,1)

legend("bottomleft", inset= 0.01, legend=names, col=c(1:6), pch=15:20, bty="n", horiz=F)

#h.kiszámolja az egyes kohorszokhoz tartozó portfólió százalékos változását (-dL/L)���/L=L)

changematrix=normalizedmatrix
for (i in 2:7){
  
  for (j in 1:length(changematrix[,i])-1) {
    changematrix[j,i]=(as.numeric(normalizedmatrix[j+1,i])-as.numeric(normalizedmatrix[j,i])) / as.numeric(normalizedmatrix[j,i])
  }
  
  
}

#i. megadja a negyedévekre számított átlagos csődrátát, valamint a kohorszok átlagos csődrátáit
  # negyedévekre számított átlagos csődráták

for (j in 1:45){
  print (mean(as.numeric(changematrix[j,]), na.rm=TRUE))
}

  # kohorszok átlagos csődrátái (f.pontban számított értékek átlaga)
for (i in 2:7){
  print (mean(as.numeric(changematrix[,i]), na.rm=TRUE))
}

# j) hisztogram az első kohorsz negyedéves csődrátáinak eloszlásáról



hist(as.numeric(changematrix[,2]))
# sorban az összes kohorosz csődrátáinak eloszlásaiban megfigyelhető a normális eloszlás
hist(as.numeric(changematrix[,3]))
hist(as.numeric(changematrix[,4]))
hist(as.numeric(changematrix[,5]))
hist(as.numeric(changematrix[,6]))
hist(as.numeric(changematrix[,7]))

