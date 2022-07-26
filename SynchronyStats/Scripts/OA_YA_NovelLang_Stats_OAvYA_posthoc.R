library(tidyverse)
library(ggplot2)
library(plyr)
library(lsr)

fullfilesYA<-grep(list.files(path = "/Users/avitalsternin/Documents/Western/Academics/PhDProject.git/Music and Memory/fMRI analysis/SynchronyStats/Data/YoungAdults_NovelLang_15clusters",
                             pattern="*.csv", full.names = TRUE), pattern='pval',inv=T, value=T)
filesYA<-grep(list.files(path="/Users/avitalsternin/Documents/Western/Academics/PhDProject.git/Music and Memory/fMRI analysis/SynchronyStats/Data/YoungAdults_NovelLang_15clusters", 
                         pattern="*.csv", full.names = FALSE), pattern='pval', inv=T, value=T)
fullfilesOA<-grep(list.files(path = "/Users/avitalsternin/Documents/Western/Academics/PhDProject.git/Music and Memory/fMRI analysis/SynchronyStats/Data/OlderAdults_NovelLang_15clusters_OAvYA",
                             pattern="*.csv", full.names = TRUE), pattern='pval',inv=T, value=T)
filesOA<-grep(list.files(path="/Users/avitalsternin/Documents/Western/Academics/PhDProject.git/Music and Memory/fMRI analysis/SynchronyStats/Data/OlderAdults_NovelLang_15clusters_OAvYA", 
                         pattern="*.csv", full.names = FALSE), pattern='pval', inv=T, value=T)

#Precentral Gyrus
f=9
dataYA_all<-read.csv(fullfilesYA[f], header=FALSE) #load data
dataYA<-subset(dataYA_all, select=-c(V1,V8))
dataYA<-rename(dataYA,c("V2"="YA_song2", "V3"="YA_song3", "V4"="YA_song4",
                        "V5"="YA_song5", "V6"="YA_song6", "V7"="YA_song7"))
dataYA <- dataYA[-c(2), ]
dataOA<-read.csv(fullfilesOA[f], header=FALSE) #load data
dataOA<-rename(dataOA,c("V1"="OA_song2", "V2"="OA_song3", "V3"="OA_song4", "V4"="OA_song5",
                        "V5"="OA_song6", "V6"="OA_song7"))
dataYA_r<-dataYA %>% gather(label,corr)
dataOA_r<-dataOA %>% gather(label,corr)
t.test(dataYA_r$corr,dataOA_r$corr)
cohensD(dataYA_r$corr,dataOA_r$corr)

dataYAOA_r<-rbind(dataYA_r,dataOA_r)
Y=nrow(dataYA)
O=nrow(dataOA)
song<-c(rep(2,Y),rep(3,Y),rep(4,Y),rep(5,Y),rep(6,Y),rep(7,Y),rep(2,O),rep(3,O),rep(4,O),rep(5,O),rep(6,O),rep(7,O))
group<-c(rep('YA',nrow(dataYA_r)),rep('OA',nrow(dataOA_r)))
type<-c(rep('s',Y),rep('s',Y),rep('w',Y),rep('w',Y),rep('i',Y),rep('i',Y),rep('s',O),rep('s',O),rep('w',O),rep('w',O),rep('i',O),rep('i',O))

TR=nrow(dataYA_r)+nrow(dataOA_r)

dataYAOA<-data.frame(corr=double(TR),song=as.factor(integer(TR)),group=character(TR),type=character(TR))
dataYAOA$corr<-dataYAOA_r$corr
dataYAOA$song<-as.factor(song)
dataYAOA$group<-group
dataYAOA$type<-type

fit<-aov(corr~group*type,data=dataYAOA) 
print(summary(fit))
TukeyHSD(fit)
interaction.plot(dataYAOA$type,dataYAOA$group,dataYAOA$corr,fun=mean)
