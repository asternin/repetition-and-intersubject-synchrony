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
YALyrOr<-read.csv("/Users/avitalsternin/Documents/Western/Academics/PhDProject.git/Music and Memory/BehaviouralResults/YoungAdults/LyricOrientation/LyrOrScores_23.csv")
OALyrOr<-read.csv("/Users/avitalsternin/Documents/Western/Academics/PhDProject.git/Music and Memory/BehaviouralResults/OlderAdults/LyrOrScores_13.csv")
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
  
 YA_I<-subset(dataYA,select=c(YA_song6,YA_song7))
 YA_I_r<-YA_I %>% gather(label,corr)
 OA_I<-subset(dataOA,select=c(OA_song6,OA_song7))
 OA_I_r<-OA_I %>% gather(label,corr)
 YA_OA_I<-rbind(YA_I_r,OA_I_r)
 
 YA_S<-subset(dataYA,select=c(YA_song2,YA_song3))
 YA_S_r<-YA_S %>% gather(label,corr)
 OA_S<-subset(dataOA,select=c(OA_song2,OA_song3))
 OA_S_r<-OA_S %>% gather(label,corr)
 YA_OA_S<-rbind(YA_S_r,OA_S_r)
 
 YA_W<-subset(dataYA,select=c(YA_song4,YA_song5))
 YA_W_r<-YA_W %>% gather(label,corr)
 OA_W<-subset(dataOA,select=c(OA_song4,OA_song5))
 OA_W_r<-OA_W %>% gather(label,corr)
 YA_OA_W<-rbind(YA_W_r,OA_W_r)

 YA_LyrOr_data<-cbind(YA_I,YA_S,YA_W,YALyrOr)
 OA_LyrOr_data<-cbind(OA_I,OA_S,OA_W,OALyrOr)
 
  ##### RUN ALL STATS #####
  
  ##### START PRINTING RESULTS TO TEXT FILE #####
  sink(file=sprintf("/Users/avitalsternin/Documents/Western/Academics/PhDProject.git/Music and Memory/fMRI analysis/SynchronyStats/Data/YA_OA_NovelLang_15clusters_OAvYA/%s.txt",str_replace(filesYA[f],".csv","")))

  filesYA[f]
  ## Stats

  print("2(group) x 3(song) ANOVA")
  fit<-aov(corr~group*type,data=dataYAOA) 
  print(summary(fit))
  a=summary(fit)[[1]][["Pr(>F)"]][[1]]
  pval<-c(pval,a)
  a=summary(fit)[[1]][["Pr(>F)"]][[2]]
  pval<-c(pval,a)
  a=summary(fit)[[1]][["Pr(>F)"]][[3]]
  pval<-c(pval,a)
  print(etaSquared(fit))
  
  print("stim means")
  print(tapply(dataYAOA$corr,dataYAOA$type,mean))
  print("group means")
  print(tapply(dataYAOA$corr,dataYAOA$group,mean))
  
  print(TukeyHSD(fit,"group"))
  
  
  t<-print(t.test(YA_OA_I$corr,YA_OA_S$corr))
  pval<-c(pval,t$p.value)
  print(cohensD(YA_OA_I$corr,YA_OA_S$corr))
  
  t<-print(t.test(YA_OA_I$corr,YA_OA_W$corr))
  pval<-c(pval,t$p.value)
  print(cohensD(YA_OA_I$corr,YA_OA_W$corr))
  
  t<-print(t.test(YA_OA_S$corr,YA_OA_W$corr))
  pval<-c(pval,t$p.value)
  print(cohensD(YA_OA_S$corr,YA_OA_W$corr))
  
  p<-ggplot(dataYAOA, aes(x=type, y=corr, fill=group)) + 
    geom_boxplot() +
    ggtitle(filesYA[f]) +
    theme_classic(base_size=20) +
    scale_x_discrete(labels=c("i"="instrumental","s"="spoken","w"="whole")) +
    coord_cartesian(ylim=c(-0.5,1.25))
    
  plot_list[[f]]=p
  
  t<-print(cor.test(YA_LyrOr_data$YA_song6,YA_LyrOr_data$LyrOr,method="pearson"))
  pval<-c(pval,t$p.value)
  t<-print(cor.test(YA_LyrOr_data$YA_song7,YA_LyrOr_data$LyrOr,method="pearson"))
  pval<-c(pval,t$p.value)
  t<-print(cor.test(YA_LyrOr_data$YA_song2,YA_LyrOr_data$LyrOr,method="pearson"))
  pval<-c(pval,t$p.value)
  t<-print(cor.test(YA_LyrOr_data$YA_song3,YA_LyrOr_data$LyrOr,method="pearson"))
  pval<-c(pval,t$p.value)
  t<-print(cor.test(YA_LyrOr_data$YA_song4,YA_LyrOr_data$LyrOr,method="pearson"))
  pval<-c(pval,t$p.value)
  t<-print(cor.test(YA_LyrOr_data$YA_song5,YA_LyrOr_data$LyrOr,method="pearson"))
  pval<-c(pval,t$p.value)
  
  t<-print(cor.test(OA_LyrOr_data$OA_song6,OA_LyrOr_data$LyrOr,method="pearson"))
  pval<-c(pval,t$p.value)
  t<-print(cor.test(OA_LyrOr_data$OA_song7,OA_LyrOr_data$LyrOr,method="pearson"))
  pval<-c(pval,t$p.value)
  t<-print(cor.test(OA_LyrOr_data$OA_song2,OA_LyrOr_data$LyrOr,method="pearson"))
  pval<-c(pval,t$p.value)
  t<-print(cor.test(OA_LyrOr_data$OA_song3,OA_LyrOr_data$LyrOr,method="pearson"))
  pval<-c(pval,t$p.value)
  t<-print(cor.test(OA_LyrOr_data$OA_song4,OA_LyrOr_data$LyrOr,method="pearson"))
  pval<-c(pval,t$p.value)
  t<-print(cor.test(OA_LyrOr_data$OA_song5,OA_LyrOr_data$LyrOr,method="pearson"))
  pval<-c(pval,t$p.value)

  
  
  sink()
  write.csv(pval,file=sprintf("/Users/avitalsternin/Documents/Western/Academics/PhDProject.git/Music and Memory/fMRI analysis/SynchronyStats/Data/YA_OA_NovelLang_15clusters_OAvYA/%s_pval.csv",str_replace(filesYA[f],".csv","")))
}

# pdf("plots.pdf")
# for (i in 1:length(plot_list)){
#   print(plot_list[[i]])
# }
# dev.off()