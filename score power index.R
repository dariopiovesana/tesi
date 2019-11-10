dati<-read.csv("spi_matches.csv", sep=",", header = T)
dati_ita<-dati[which(dati$league=="Italy Serie A"),]
dati_ita$Esiti<-ifelse(dati_ita$score1>dati_ita$score2, "1", ifelse(dati_ita$score1==dati_ita$score2, "X", "2"))
pie(table(dati_ita$Esiti), main = "Percentuale esiti")
perc<-prop.table(table(dati_ita$Esiti))
prob<-cbind(dati_ita$prob1, dati_ita$prob2, dati_ita$probtie)
medie<-apply(prob, 2, mean)
(ita_medie<-rbind(perc, medie))#sovrastima la vittoria in casa e il pareggio e sottostima la vittoria fuori
hist(dati_ita$prob1, breaks = 20)
hist(dati_ita$prob2)#meno distribuita, raggiunge picchi intorno al 30%
hist(dati_ita$probtie)#a differenza di elo il pareggio arriva fino a 35%
summary(dati_ita$prob1)
summary(dati_ita$prob2)
summary(dati_ita$probtie)

#raggruppo di 5% in 5%
dati_ita$H_prob_group<-as.factor(round((dati_ita$prob1-.025)*20))
dati_ita$A_prob_group<-as.factor(round((dati_ita$prob2-.025)*20))
dati_ita$X_prob_group<-as.factor(round((dati_ita$probtie-.025)*20))
dati_ita$Hwin<-ifelse(dati_ita$Esiti=="1", 1, 0)
dati_ita$Awin<-ifelse(dati_ita$Esiti=="2", 1, 0)
dati_ita$Draw<-ifelse(dati_ita$Esiti=="X", 1, 0)
gruppi<-c("0-4","5-9","10-14","15-19","20-24","25-29","30-34","35-39","40-44","45-49","50-54","55-59","60-64","65-69","70-74","75-79","80-84","85-89","90-94","95-99")
mat_H<-matrix(c(table(dati_ita$H_prob_group, dati_ita$Hwin),prop.table(table(dati_ita$H_prob_group, dati_ita$Hwin),1)), 18,4);colnames(mat_H)<-c("0","1","0","1");rownames(mat_H)<-gruppi[2:19]
mat_H #fino al 19% sovrastima le possibilità della squadra in casa, da 20-24% sovrastima e poi di nuovo sovrastima la possibilità di successo in casa, a 55-59% sottostima e sebbene siano poche sopra il 70% sottostima molto
mat_A<-matrix(c(table(dati_ita$A_prob_group, dati_ita$Awin),prop.table(table(dati_ita$A_prob_group, dati_ita$Awin),1)), 16,4);colnames(mat_A)<-c("0","1","0","1");rownames(mat_A)<-gruppi[1:16]
mat_A #sovrastima le possibilità fino a 29%, da 35 a 49% e poi ancora sopra il 55% sottostima le possibilità della squadra in trasferta
mat_D<-matrix(c(table(dati_ita$X_prob_group, dati_ita$Draw),prop.table(table(dati_ita$X_prob_group, dati_ita$Draw),1)), 6,4);colnames(mat_D)<-c("0","1","0","1");rownames(mat_D)<-gruppi[2:7]
mat_D#prevede molto male i pareggi