# 5. feladat- Hitelportfóliók vintage modellje

# 0. Set as working directory

# a. Adatok betöltése "vintage_data.csv" fájlból

MyData <- read.csv(file="vintage_data.csv", header=TRUE, sep=",")

# b. L mátrix elõállítása a betöltött adat 2-7. oszlopaiból 

mymatrix <- as.matrix(MyData)

# c. Különbözõ idõpontban induló állományok idõbeli alakulása

matplot(mymatrix, type= "b")


