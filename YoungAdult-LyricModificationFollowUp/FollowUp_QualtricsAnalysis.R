library(lsr)
fname<-"~/Documents/Western/Academics/PhDProject.git/Music and Memory/BehaviouralResults/YAFollowUp-Qualtrics/Data.csv"
data<-read.table(fname, sep=",",header=TRUE)
data<-na.omit(data)
data<-data[c(2:10)]
data$X1A<-as.numeric(as.character(data$X1A))/21
data$X1B<-as.numeric(as.character(data$X1B))/29
data$X2<-as.numeric(as.character(data$X2))/10
data$X3<-as.numeric(as.character(data$X3))/10
data$X4<-as.numeric(as.character(data$X4))/10
data$X5<-as.numeric(as.character(data$X5))/10
data$X6A<-as.numeric(as.character(data$X6A))/21
data$X6B<-as.numeric(as.character(data$X6B))/29

Adata<-data[data[, "Group"]=="A",]
Adata<-Adata[c(2:9)]

Bdata<-data[data[, "Group"]=="B",]
Bdata<-Bdata[c(2:9)]



### statistical tests ###
t.test(data$X1A,data$X1B)
t.test(Adata$X1A,Adata$X1B)
t.test(Bdata$X1A,Bdata$X1B)

t.test(data$X6A,data$X6B)
t.test(Adata$X6A,Adata$X6B)
t.test(Bdata$X6A,Bdata$X6B)

t.test(data$X1A,data$X6A)
t.test(data$X1B,data$X6B)

t.test(Adata$X1A,Adata$X6A)
t.test(Adata$X1B,Adata$X6B)
t.test(Bdata$X1A,Bdata$X6A)
t.test(Bdata$X1B,Bdata$X6B)

UT1<-c(Adata$X1B, Bdata$X1A)
UT6<-c(Adata$X6B, Bdata$X6A)
T1<-c(Adata$X1A, Bdata$X1B)
T6<-c(Adata$X6A, Bdata$X6B)

t.test(T1,T6)
t.test(UT1,UT6)
t.test(T1,UT1)
t.test(T6,UT6)
all_data<-c(UT1,UT6,T1,T6)
tmp1<-rep('UT',64)
tmp2<-rep('T',64)
train<-c(tmp1,tmp2)
ses<-rep(c(1,6), each=32, times=2)
for_aov<-data.frame(all_data,train,ses)

anova<-aov(all_data~as.factor(train)*as.factor(ses),data=for_aov)
summary(anova)
etaSquared(anova)
interaction.plot(ses,train,all_data,type="b",col=c("#6633CC",2),
                 leg.bty="o",leg.bg="white",lwd=2,pch=c(18,24),xlab="Session",
                 ylab="Training",main="Interaction plot")

#compare to trained data#
fname<-"/Users/avitalsternin/Documents/Western/Academics/PhDProject.git/Music and Memory/BehaviouralResults/YoungAdults/LyricModification/LyricMod.csv"
LyrModdata<-read.table(fname, sep=",",header=FALSE)
tmp<-split(LyrModdata,LyrModdata$V1)
LM_ses1<-(tmp$'1'$V2)/100
LM_ses6<-(tmp$'6'$V2)/100

t.test(data$X1A,LM_ses1)
t.test(data$X1B,LM_ses1)
t.test(data$X6A,LM_ses6)
t.test(data$X6B,LM_ses6)

t.test(T6,LM_ses6)

#group all ses 1 vs all ses 6 #
X1AB<-stack(data, select = c(X1A, X1B))
X6AB<-stack(data, select = c(X6A, X6B))

t.test(X1AB$values,X6AB$values)
cohensD(X1AB$values,X6AB$values, method='paired')

t.test(X1AB$values,LM_ses1)
cohensD(X1AB$values,LM_ses1, method='pooled')

t.test(X6AB$values,LM_ses6)
cohensD(X6AB$values,LM_ses6, method='pooled')

FULL<-c(X1AB$values,X6AB$values,LM_ses1,LM_ses6)
tmp1<-rep('online',128)
tmp2<-rep('original',40)
exp<-c(tmp1,tmp2)
tmp1<-rep(c(1,6), each=64)
tmp2<-rep(c(1,6),each=20)
ses<-c(tmp1,tmp2)
for_aov2<-data.frame(FULL,exp,ses)

anova<-aov(FULL~as.factor(exp)*as.factor(ses),data=for_aov2)
summary(anova)
etaSquared(anova,type=1)
interaction.plot(ses,exp,FULL,type="b",col=c("#6633CC",2),
                 leg.bty="o",leg.bg="white",lwd=2,pch=c(18,24),xlab="Session",
                 ylab="Experiment",main="Interaction plot")

### Graph ###
library(ggplot2)
library(GMCM)
group<-c(rep("A",8),rep("B",8))
session<-rep(c("1A","1B","2","3","4","5","6A","6B"),2)
Amean<-colMeans(Adata)
Asd<-apply(Adata,2,sd)
Bmean<-colMeans(Bdata)
Bsd<-apply(Bdata,2,sd)

mean<-c(Amean,Bmean)
sd<-c(Asd,Bsd)
mean_data <- data.frame(group,session,mean,sd)

ggplot(mean_data, aes(fill=group,x=session,y=mean)) +
  geom_bar(position="dodge", stat="identity") +
  scale_fill_brewer(palette="OrRd")+
  geom_errorbar(aes (x=session,ymin=mean-sd,ymax=mean+sd), width=0.4, colour="black", alpha=0.5, size=.8,position=position_dodge(.9)) +
  geom_hline(yintercept=0.5, linetype="dashed",color = "black", size=.5) +
  theme_bw()
