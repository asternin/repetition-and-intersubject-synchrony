library(tidyverse)
library(ggplot2)
library(plyr)
library(gridExtra)
library(grid)
library(lattice)

fullfilesYA<-grep(list.files(path = "/Users/avitalsternin/Documents/Western/Academics/PhDProject.git/Music and Memory/fMRI analysis/SynchronyStats/Data/YoungAdults_NovelLang",
                             pattern="*.csv", full.names = TRUE), pattern='pval',inv=T, value=T)
filesYA<-grep(list.files(path="/Users/avitalsternin/Documents/Western/Academics/PhDProject.git/Music and Memory/fMRI analysis/SynchronyStats/Data/YoungAdults_NovelLang", 
                         pattern="*.csv", full.names = FALSE), pattern='pval', inv=T, value=T)
fullfilesOA<-grep(list.files(path = "/Users/avitalsternin/Documents/Western/Academics/PhDProject.git/Music and Memory/fMRI analysis/SynchronyStats/Data/OlderAdults_NovelLang_OAvYA",
                             pattern="*.csv", full.names = TRUE), pattern='pval',inv=T, value=T)
filesOA<-grep(list.files(path="/Users/avitalsternin/Documents/Western/Academics/PhDProject.git/Music and Memory/fMRI analysis/SynchronyStats/Data/OlderAdults_NovelLang_OAvYA", 
                         pattern="*.csv", full.names = FALSE), pattern='pval', inv=T, value=T)

plot_list=list()

for(f in 1:length(fullfilesYA)){
  pval<-c()
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
  
  p<-ggplot(dataYAOA, aes(x=type, y=corr, fill=group)) + 
    geom_boxplot(lwd=0.25,fatten=0.5, show.legend=FALSE) +
    #ggtitle(filesYA[f]) +
    ylab("Intersubject Synchrony")+
    xlab("")+
    theme_classic() +
    scale_x_discrete(labels=c("i"="instrumental","s"="spoken","w"="whole")) +
    coord_cartesian(ylim=c(-0.5,1.25))
  
  plot_list[[f]]=p
  
}

gs <- lapply(1:17, function(ii) 
  grobTree(rectGrob(gp=gpar(fill=ii, alpha=0.5)), textGrob(ii)))

hlay2 <- rbind(c(13,4,NA,1,12),
              c(15,3,NA,9,11),
              c(2,14,NA,10,8),
              c(16,NA,NA,NA,17),
              c(NA,5,6,7,NA))
hlay1 <- rbind(c(1,2,NA,3,4),
               c(5,6,NA,7,8),
               c(9,10,NA,11,12),
               c(13,NA,NA,NA,14),
               c(NA,15,16,17,NA))
select_grobs <- function(lay) {
  id <- unique(c(t(lay))) 
  id[!is.na(id)]
} 
grid.arrange(grobs=plot_list[select_grobs(hlay2)], layout_matrix=hlay1)

pdf("plots.pdf")
for (i in 1:length(plot_list)){
  print(plot_list[[i]])
}
dev.off()