# 5. feladat- Hitelportf�li�k vintage modellje

# 0. Set as working directory

# a. Adatok bet�lt�se "vintage_data.csv" f�jlb�l

MyData <- read.csv(file="vintage_data.csv", header=TRUE, sep=",")

# b. L m�trix el��ll�t�sa a bet�lt�tt adat 2-7. oszlopaib�l 

mymatrix <- as.matrix(MyData)

# c. K�l�nb�z� id�pontban indul� �llom�nyok id�beli alakul�sa

matplot(mymatrix, type= "b")

