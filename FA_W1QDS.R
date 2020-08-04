##First approach on Data "Week 1 Quiz Data Set"

#Reading DS
Week1DS <- read.csv("hw1_data.csv")

#Taking a look on it
print(Week1DS)

#What kind of DS is "Week1DS"
is.array(Week1DS)
is.matrix(Week1DS)
is.list(Week1DS)
is.data.frame(Week1DS)
#It is a data framed list?!

#Number of rows in the DS
nrow(Week1DS)

#Printing the last two rows
print(Week1DS[152:153,])
print(Week1DS, skip.ro = 152)

#Printing row n. 47
print(Week1DS[47,])

#Counting how many NA's in each colum
colSums(is.na(Week1DS))

#Mean of the "Ozone" col (Without the NA'S)
mean(Week1DS$Ozone, na.rm = T)
good<-complete.cases(Week1DS)
mean(Week1DS$Ozone[good])

#Here something interesting happens, when we calculate the mean w/ the
#with the option na.rm as true we get 42.12931. When we create a vector
#to use as "filter" (i don't know if i named the usage correctly) on mean
#function we get 42.0991. You know why this happens? If you do please send 
#it on feedback.

#Creating Vectors to create subset of the matrix
BOA<-(Week1DS$Ozone > 31)
BOA2<-(Week1DS$Tem > 90)
M6<- (Week1DS$Month == 6)
M5<- (Week1DS$Month == 5)

#Operations requested
mean(Week1DS$Solar.R [BOA] [BOA2], na.rm = T)
mean(Week1DS$Temp [M6])
max(Week1DS$Ozone [M5], na.rm = T)
