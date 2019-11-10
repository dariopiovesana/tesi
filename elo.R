dati_elo<-read.csv("elo_fine.csv", sep=";", header = T)
pie(table(dati_elo$Esito), main = "Percentuale esiti")
perc<-prop.table(table(dati_elo$Esito))
prob<-cbind(dati_elo$X1_prob_elo, dati_elo$X2_prob_elo, dati_elo$X_prob_elo)
medie<-apply(prob, 2, mean)*0.01
(elo_medie<-rbind(perc, medie))#viene sovrastimata la vittoria in casa rispetto a quella fuori casa
dati_elo$Data<-as.character.Date(dati_elo$Data)
dati_elo$Mese<-substr(dati_elo$Data, 4, 5)
dati_elo$Hwin<-ifelse(dati_elo$Esito=="1", 1, 0)
dati_elo$Awin<-ifelse(dati_elo$Esito=="2", 1, 0)
dati_elo$Draw<-ifelse(dati_elo$Esito=="X", 1, 0)
hist(dati_elo$X1_prob_elo, breaks = 20)#media intorno ai 45, valori molto vicini alla media tra 20 e 70
hist(dati_elo$X2_prob_elo)#circa normale, con media intorno ai 20-25
hist(dati_elo$X_prob_elo, breaks = 30)#probabilità crescente fino a 30
sum(dati_elo$X_prob_elo>30)#0
summary(dati_elo$X1_prob_elo)#media e mediana vicine
summary(dati_elo$X_prob_elo)#mediana superiore alla media
summary(dati_elo$X2_prob_elo)#mediana inferiore alla media
n<-nrow(dati_elo)
sum(dati_elo$Draw[which(dati_elo$X_prob_elo>26)])/sum(dati_elo$X_prob_elo>26)#accuracy 0.2853
sum(dati_elo$Draw[which(dati_elo$X_prob_elo<26)])/sum(dati_elo$X_prob_elo<26)#accuracy 0.1918
mean(dati_elo$X_prob_elo[which(dati_elo$X_prob_elo>26)])
#28.53-28.32=0.2%, se puntassi solo sui pareggi delle partite date sopra il 26% avrei un guadagno

#raggruppo di 5% in 5%
dati_elo$H_prob_group<-as.factor(round((dati_elo$X1_prob_elo-2.5)/5))
dati_elo$A_prob_group<-as.factor(round((dati_elo$X2_prob_elo-2.5)/5))
dati_elo$X_prob_group<-as.factor(round((dati_elo$X_prob_elo-2.5)/5))
gruppi<-c("0-4","5-9","10-14","15-19","20-24","25-29","30-34","35-39","40-44","45-49","50-54","55-59","60-64","65-69","70-74","75-79","80-84","85-89","90-94","95-99")
mat_H<-matrix(c(table(dati_elo$H_prob_group, dati_elo$Hwin),prop.table(table(dati_elo$H_prob_group, dati_elo$Hwin),1)), 19,4);colnames(mat_H)<-c("0","1","0","1");rownames(mat_H)<-gruppi[1:19]
mat_H #tra 25 e 29 sembra sbagliare al ribasso, anche tra 75 e 79, proprio sui quartili.
mat_A<-matrix(c(table(dati_elo$A_prob_group, dati_elo$Awin),prop.table(table(dati_elo$A_prob_group, dati_elo$Awin),1)), 17,4);colnames(mat_A)<-c("0","1","0","1");rownames(mat_A)<-gruppi[1:17]
mat_A #sbaglia positivamente tra 15 e 19%, tra 35 e 54%, ancora a 65-74
mat_D<-matrix(c(table(dati_elo$X_prob_group, dati_elo$Draw),prop.table(table(dati_elo$X_prob_group, dati_elo$Draw),1)), 5,4);colnames(mat_D)<-c("0","1","0","1");rownames(mat_D)<-gruppi[1:5]
mat_D#sbaglia positivamente nei pareggi tra 15 e 19%

#voglio vedere se l'importanza delle partite conta, vado a vedere ad aprile, maggio
mat_H5<-matrix(c(table(dati_elo$H_prob_group[which(dati_elo$Mese=="05")], dati_elo$Hwin[which(dati_elo$Mese=="05")]),prop.table(table(dati_elo$H_prob_group[which(dati_elo$Mese=="05")], dati_elo$Hwin[which(dati_elo$Mese=="05")]),1)), 19,4);colnames(mat_H5)<-c("0","1","0","1");rownames(mat_H5)<-gruppi[1:19]
mat_H5 #troppo ridotto il campione

#modello multinomiale
library(nnet)
#con prob reali
m0<-multinom(Esito~X1_prob_elo+X_prob_elo+X2_prob_elo, dati_elo)
summary(m0) #il fatto di giocare in casa o in trasferta è significativo
#con prob a gruppi
m1<-multinom(Esito~H_prob_group+A_prob_group+X_prob_group, dati_elo)
summary(m1)
#ordinati
dati_elo$H_prob_group<-ordered(dati_elo$H_prob_group)
dati_elo$A_prob_group<-ordered(dati_elo$A_prob_group)
dati_elo$X_prob_group<-ordered(dati_elo$X_prob_group)
m2<-multinom(Esito~H_prob_group+A_prob_group+X_prob_group, dati_elo)
summary(m2)

#modello a quote proporzionali
#ovvero ritengo che il giocare in casa sia un vantaggio
dati_elo$Esito<-ordered(dati_elo$Esito)
library(MASS)
m3<-polr(Esito~H_prob_group+A_prob_group+X_prob_group, dati_elo)
summary(m3)
#standard error troppo alti rispetto alle stime
#variabili non significative