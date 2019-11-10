#si parte da riga 300
#2014-2015
risultati_14_15<-read.csv("dr_serie_a_2014-2015_prova.csv", sep = ";")
risultati_14_15$result<-as.character(risultati_14_15$result)
risultati_14_15$result<-gsub("gen", "1", risultati_14_15$result)
risultati_14_15$result<-gsub("feb", "2", risultati_14_15$result)
risultati_14_15$result<-gsub("mar", "3", risultati_14_15$result)
risultati_14_15$result<-gsub("apr", "4", risultati_14_15$result)
risultati_14_15$result<-gsub("mag", "5", risultati_14_15$result)
risultati_14_15$result<-gsub("giu", "6", risultati_14_15$result)
risultati_14_15$result<-gsub("lug", "7", risultati_14_15$result)
risultati_14_15$result<-gsub("01", "1", risultati_14_15$result)
risultati_14_15$result<-gsub("02", "2", risultati_14_15$result)
risultati_14_15$result<-gsub("03", "3", risultati_14_15$result)
risultati_14_15$result<-gsub("04", "4", risultati_14_15$result)
risultati_14_15$result<-gsub("05", "5", risultati_14_15$result)
risultati_14_15$result<-gsub("06", "6", risultati_14_15$result)
risultati_14_15$result<-gsub("07", "7", risultati_14_15$result)
risultati_14_15$match<-as.character(risultati_14_15$match)
risultati_14_15$date<-as.character(risultati_14_15$date)
risultati_14_15$result<-as.character(risultati_14_15$result)
#2015-2016
risultati_15_16<-read.csv("dr_serie_a_2015-2016_prova.csv", sep = ";")
risultati_15_16$result<-as.character(risultati_15_16$result)
risultati_15_16$result<-gsub("gen", "1", risultati_15_16$result)
risultati_15_16$result<-gsub("feb", "2", risultati_15_16$result)
risultati_15_16$result<-gsub("mar", "3", risultati_15_16$result)
risultati_15_16$result<-gsub("apr", "4", risultati_15_16$result)
risultati_15_16$result<-gsub("mag", "5", risultati_15_16$result)
risultati_15_16$result<-gsub("giu", "6", risultati_15_16$result)
risultati_15_16$result<-gsub("lug", "7", risultati_15_16$result)
risultati_15_16$result<-gsub("01", "1", risultati_15_16$result)
risultati_15_16$result<-gsub("02", "2", risultati_15_16$result)
risultati_15_16$result<-gsub("03", "3", risultati_15_16$result)
risultati_15_16$result<-gsub("04", "4", risultati_15_16$result)
risultati_15_16$result<-gsub("05", "5", risultati_15_16$result)
risultati_15_16$result<-gsub("06", "6", risultati_15_16$result)
risultati_15_16$result<-gsub("07", "7", risultati_15_16$result)
risultati_15_16$match<-as.character(risultati_15_16$match)
risultati_15_16$date<-as.character(risultati_15_16$date)
risultati_15_16$result<-as.character(risultati_15_16$result)
#2016-2017
risultati_16_17<-read.csv("dr_serie_a_2016-2017_prova.csv", sep = ";")
risultati_16_17$result<-as.character(risultati_16_17$result)
risultati_16_17$result<-gsub("gen", "1", risultati_16_17$result)
risultati_16_17$result<-gsub("feb", "2", risultati_16_17$result)
risultati_16_17$result<-gsub("mar", "3", risultati_16_17$result)
risultati_16_17$result<-gsub("apr", "4", risultati_16_17$result)
risultati_16_17$result<-gsub("mag", "5", risultati_16_17$result)
risultati_16_17$result<-gsub("giu", "6", risultati_16_17$result)
risultati_16_17$result<-gsub("lug", "7", risultati_16_17$result)
risultati_16_17$result<-gsub("01", "1", risultati_16_17$result)
risultati_16_17$result<-gsub("02", "2", risultati_16_17$result)
risultati_16_17$result<-gsub("03", "3", risultati_16_17$result)
risultati_16_17$result<-gsub("04", "4", risultati_16_17$result)
risultati_16_17$result<-gsub("05", "5", risultati_16_17$result)
risultati_16_17$result<-gsub("06", "6", risultati_16_17$result)
risultati_16_17$result<-gsub("07", "7", risultati_16_17$result)
risultati_16_17$match<-as.character(risultati_16_17$match)
risultati_16_17$date<-as.character(risultati_16_17$date)
risultati_16_17$result<-as.character(risultati_16_17$result)
#2017-2018
risultati_17_18<-read.csv("dr_serie_a_2017-2018_prova.csv", sep = ";")
risultati_17_18$result<-as.character(risultati_17_18$result)
risultati_17_18$result<-gsub("gen", "1", risultati_17_18$result)
risultati_17_18$result<-gsub("feb", "2", risultati_17_18$result)
risultati_17_18$result<-gsub("mar", "3", risultati_17_18$result)
risultati_17_18$result<-gsub("apr", "4", risultati_17_18$result)
risultati_17_18$result<-gsub("mag", "5", risultati_17_18$result)
risultati_17_18$result<-gsub("giu", "6", risultati_17_18$result)
risultati_17_18$result<-gsub("lug", "7", risultati_17_18$result)
risultati_17_18$result<-gsub("01", "1", risultati_17_18$result)
risultati_17_18$result<-gsub("02", "2", risultati_17_18$result)
risultati_17_18$result<-gsub("03", "3", risultati_17_18$result)
risultati_17_18$result<-gsub("04", "4", risultati_17_18$result)
risultati_17_18$result<-gsub("05", "5", risultati_17_18$result)
risultati_17_18$result<-gsub("06", "6", risultati_17_18$result)
risultati_17_18$result<-gsub("07", "7", risultati_17_18$result)
risultati_17_18$match<-as.character(risultati_17_18$match)
risultati_17_18$date<-as.character(risultati_17_18$date)
risultati_17_18$result<-as.character(risultati_17_18$result)
#2018-2019
risultati_18_19<-read.csv("dr_serie_a_2018-2019.csv", sep = ";")
risultati_18_19$match<-as.character(risultati_18_19$match)
risultati_18_19$result<-gsub("gen", "1", risultati_18_19$result)
risultati_18_19$result<-gsub("feb", "2", risultati_18_19$result)
risultati_18_19$result<-gsub("mar", "3", risultati_18_19$result)
risultati_18_19$result<-gsub("apr", "4", risultati_18_19$result)
risultati_18_19$result<-gsub("mag", "5", risultati_18_19$result)
risultati_18_19$result<-gsub("giu", "6", risultati_18_19$result)
risultati_18_19$result<-gsub("lug", "7", risultati_18_19$result)
risultati_18_19$result<-gsub("01", "1", risultati_18_19$result)
risultati_18_19$result<-gsub("02", "2", risultati_18_19$result)
risultati_18_19$result<-gsub("03", "3", risultati_18_19$result)
risultati_18_19$result<-gsub("04", "4", risultati_18_19$result)
risultati_18_19$result<-gsub("05", "5", risultati_18_19$result)
risultati_18_19$result<-gsub("06", "6", risultati_18_19$result)
risultati_18_19$result<-gsub("07", "7", risultati_18_19$result)
risultati_18_19$match<-as.character(risultati_18_19$match)
risultati_18_19$date<-as.character(risultati_18_19$date)
risultati_18_19$result<-as.character(risultati_18_19$result)
#2019-2020
risultati_19_20<-read.csv("dr_serie_a_2019-2020.csv", sep = ";")
risultati_19_20$match<-as.character(risultati_19_20$match)
risultati_19_20$result<-gsub("gen", "1", risultati_19_20$result)
risultati_19_20$result<-gsub("feb", "2", risultati_19_20$result)
risultati_19_20$result<-gsub("mar", "3", risultati_19_20$result)
risultati_19_20$result<-gsub("apr", "4", risultati_19_20$result)
risultati_19_20$result<-gsub("mag", "5", risultati_19_20$result)
risultati_19_20$result<-gsub("giu", "6", risultati_19_20$result)
risultati_19_20$result<-gsub("lug", "7", risultati_19_20$result)
risultati_19_20$result<-gsub("01", "1", risultati_19_20$result)
risultati_19_20$result<-gsub("02", "2", risultati_19_20$result)
risultati_19_20$result<-gsub("03", "3", risultati_19_20$result)
risultati_19_20$result<-gsub("04", "4", risultati_19_20$result)
risultati_19_20$result<-gsub("05", "5", risultati_19_20$result)
risultati_19_20$result<-gsub("06", "6", risultati_19_20$result)
risultati_19_20$result<-gsub("07", "7", risultati_19_20$result)
risultati_19_20$match<-as.character(risultati_19_20$match)
risultati_19_20$date<-as.character(risultati_19_20$date)
risultati_19_20$result<-as.character(risultati_19_20$result)
#19-20
odds_19_20<-read.csv("serie_a_2019-2020.csv", sep = ";", header = T)
partite1<-as.character(unique(odds_19_20$match))
matdat1<-matrix(NA, NROW(partite1), 7)
for (i in partite1){
  hw<-mean(odds_19_20$Home[which(odds_19_20$match==i)])
  dr<-mean(odds_19_20$Draw[which(odds_19_20$match==i)])
  aw<-mean(odds_19_20$Away[which(odds_19_20$match==i)])
  mhw<-max(odds_19_20$Home[which(odds_19_20$match==i)])
  mdr<-max(odds_19_20$Draw[which(odds_19_20$match==i)])
  maw<-max(odds_19_20$Away[which(odds_19_20$match==i)])
  matdat1[which(partite1==i),]<-c(i, hw, dr, aw, mhw, mdr, maw)
}
#18-19
odds_18_19<-read.csv("serie_a_2018-2019.csv", sep = ";", header = T)
partite2<-as.character(unique(odds_18_19$match))
matdat2<-matrix(NA, NROW(partite2), 7)
for (i in partite2){
  hw<-mean(odds_18_19$Home[which(odds_18_19$match==i)])
  dr<-mean(odds_18_19$Draw[which(odds_18_19$match==i)])
  aw<-mean(odds_18_19$Away[which(odds_18_19$match==i)])
  mhw<-max(odds_18_19$Home[which(odds_18_19$match==i)])
  mdr<-max(odds_18_19$Draw[which(odds_18_19$match==i)])
  maw<-max(odds_18_19$Away[which(odds_18_19$match==i)])
  matdat2[which(partite2==i),]<-c(i, hw, dr, aw, mhw, mdr, maw)
}
#17-18
odds_17_18<-read.csv("serie_a_2017-2018.csv", sep = ";", header = T)
partite3<-as.character(unique(odds_17_18$match))
matdat3<-matrix(NA, NROW(partite3), 7)
for (i in partite3){
  hw<-mean(odds_17_18$Home[which(odds_17_18$match==i)])
  dr<-mean(odds_17_18$Draw[which(odds_17_18$match==i)])
  aw<-mean(odds_17_18$Away[which(odds_17_18$match==i)])
  mhw<-max(odds_17_18$Home[which(odds_17_18$match==i)])
  mdr<-max(odds_17_18$Draw[which(odds_17_18$match==i)])
  maw<-max(odds_17_18$Away[which(odds_17_18$match==i)])
  matdat3[which(partite3==i),]<-c(i, hw, dr, aw, mhw, mdr, maw)
}
#16-17
odds_16_17<-read.csv("serie_a_2016-2017.csv", sep = ";", header = T)
partite4<-as.character(unique(odds_16_17$match))
matdat4<-matrix(NA, NROW(partite4), 7)
for (i in partite4){
  hw<-mean(odds_16_17$Home[which(odds_16_17$match==i)])
  dr<-mean(odds_16_17$Draw[which(odds_16_17$match==i)])
  aw<-mean(odds_16_17$Away[which(odds_16_17$match==i)])
  mhw<-max(odds_16_17$Home[which(odds_16_17$match==i)])
  mdr<-max(odds_16_17$Draw[which(odds_16_17$match==i)])
  maw<-max(odds_16_17$Away[which(odds_16_17$match==i)])
  matdat4[which(partite4==i),]<-c(i, hw, dr, aw, mhw, mdr, maw)
}
#15-16
odds_15_16<-read.csv("serie_a_2015-2016.csv", sep = ";", header = T)
partite5<-as.character(unique(odds_15_16$match))
matdat5<-matrix(NA, NROW(partite5), 7)
for (i in partite5){
  hw<-mean(odds_15_16$Home[which(odds_15_16$match==i)])
  dr<-mean(odds_15_16$Draw[which(odds_15_16$match==i)])
  aw<-mean(odds_15_16$Away[which(odds_15_16$match==i)])
  mhw<-max(odds_15_16$Home[which(odds_15_16$match==i)])
  mdr<-max(odds_15_16$Draw[which(odds_15_16$match==i)])
  maw<-max(odds_15_16$Away[which(odds_15_16$match==i)])
  matdat5[which(partite5==i),]<-c(i, hw, dr, aw, mhw, mdr, maw)
}
#14-15
odds_14_15<-read.csv("serie_a_2014-2015.csv", sep = ";", header = T)
partite6<-as.character(unique(odds_14_15$match))
matdat6<-matrix(NA, NROW(partite6), 7)
for (i in partite6){
  hw<-mean(odds_14_15$Home[which(odds_14_15$match==i)])
  dr<-mean(odds_14_15$Draw[which(odds_14_15$match==i)])
  aw<-mean(odds_14_15$Away[which(odds_14_15$match==i)])
  mhw<-max(odds_14_15$Home[which(odds_14_15$match==i)])
  mdr<-max(odds_14_15$Draw[which(odds_14_15$match==i)])
  maw<-max(odds_14_15$Away[which(odds_14_15$match==i)])
  matdat6[which(partite6==i),]<-c(i, hw, dr, aw, mhw, mdr, maw)
}

#aggiungo risultato e data
#19-20
matdat1<-as.data.frame(matdat1)
colnames(matdat1)<-c("match", "mean_home_odd", "mean_draw_odd", "mean_away_odd", "max_home_odd", "max_draw_odd", "max_away_odd")
matdat1$match<-as.character(matdat1$match)
matdat1$result<-NA
matdat1$date<-NA
for (i in 1:nrow(matdat1)){
  for (j in 1:nrow(risultati_19_20)){
if(identical(matdat1[i,1],risultati_19_20$match[j])) {matdat1$result[i]<-risultati_19_20$result[j];matdat1$date[i]<-risultati_19_20$date[j]}
print(i)
}
}
#18-19
matdat2<-as.data.frame(matdat2)
colnames(matdat2)<-c("match", "mean_home_odd", "mean_draw_odd", "mean_away_odd", "max_home_odd", "max_draw_odd", "max_away_odd")
matdat2$match<-as.character(matdat2$match)
matdat2$result<-NA
matdat2$date<-NA
for (i in 1:nrow(matdat2)){
  for (j in 1:nrow(risultati_18_19)){
    if(identical(matdat2[i,1],risultati_18_19$match[j])) {matdat2$result[i]<-risultati_18_19$result[j];matdat2$date[i]<-risultati_18_19$date[j]}
    print(i)
  }
}
#17-18
matdat3<-as.data.frame(matdat3)
colnames(matdat3)<-c("match", "mean_home_odd", "mean_draw_odd", "mean_away_odd", "max_home_odd", "max_draw_odd", "max_away_odd")
matdat3$match<-as.character(matdat3$match)
matdat3$result<-NA
matdat3$date<-NA
for (i in 1:nrow(matdat3)){
  for (j in 1:nrow(risultati_17_18)){
    if(identical(matdat3[i,1],risultati_17_18$match[j])) {matdat3$result[i]<-risultati_17_18$result[j];matdat3$date[i]<-risultati_17_18$date[j]}
    print(i)
  }
}
#16-17
matdat4<-as.data.frame(matdat4)
colnames(matdat4)<-c("match", "mean_home_odd", "mean_draw_odd", "mean_away_odd", "max_home_odd", "max_draw_odd", "max_away_odd")
matdat4$match<-as.character(matdat4$match)
matdat4$result<-NA
matdat4$date<-NA
for (i in 1:nrow(matdat4)){
  for (j in 1:nrow(risultati_16_17)){
    if(identical(matdat4[i,1],risultati_16_17$match[j])) {matdat4$result[i]<-risultati_16_17$result[j];matdat4$date[i]<-risultati_16_17$date[j]}
    print(i)
  }
}
#15-16
matdat5<-as.data.frame(matdat5)
colnames(matdat5)<-c("match", "mean_home_odd", "mean_draw_odd", "mean_away_odd", "max_home_odd", "max_draw_odd", "max_away_odd")
matdat5$match<-as.character(matdat5$match)
matdat5$result<-NA
matdat5$date<-NA
for (i in 1:nrow(matdat5)){
  for (j in 1:nrow(risultati_15_16)){
    if(identical(matdat5[i,1],risultati_15_16$match[j])) {matdat5$result[i]<-risultati_15_16$result[j];matdat5$date[i]<-risultati_15_16$date[j]}
    print(i)
  }
}
#14-15
matdat6<-as.data.frame(matdat6)
colnames(matdat6)<-c("match", "mean_home_odd", "mean_draw_odd", "mean_away_odd", "max_home_odd", "max_draw_odd", "max_away_odd")
matdat6$match<-as.character(matdat6$match)
matdat6$result<-NA
matdat6$date<-NA
for (i in 1:nrow(matdat6)){
  for (j in 1:nrow(risultati_14_15)){
    if(identical(matdat6[i,1],risultati_14_15$match[j])) {matdat6$result[i]<-risultati_14_15$result[j];matdat6$date[i]<-risultati_14_15$date[j]}
    print(i)
  }
}

#unisco il dataset
dataset_finale<-rbind(matdat1,matdat2,matdat3,matdat4,matdat5,matdat6)
dataset_finale$mean_home_odd<-as.character(dataset_finale$mean_home_odd)
dataset_finale$mean_home_odd<-as.numeric(dataset_finale$mean_home_odd)
dataset_finale$max_home_odd<-as.character(dataset_finale$max_home_odd)
dataset_finale$max_home_odd<-as.numeric(dataset_finale$max_home_odd)
dataset_finale$mean_away_odd<-as.character(dataset_finale$mean_away_odd)
dataset_finale$mean_away_odd<-as.numeric(dataset_finale$mean_away_odd)
dataset_finale$max_away_odd<-as.character(dataset_finale$max_away_odd)
dataset_finale$max_away_odd<-as.numeric(dataset_finale$max_away_odd)
dataset_finale$mean_draw_odd<-as.character(dataset_finale$mean_draw_odd)
dataset_finale$mean_draw_odd<-as.numeric(dataset_finale$mean_draw_odd)
dataset_finale$max_draw_odd<-as.character(dataset_finale$max_draw_odd)
dataset_finale$max_draw_odd<-as.numeric(dataset_finale$max_draw_odd)
dataset_finale$p1mean<-1/dataset_finale$mean_home_odd
dataset_finale$p2mean<-1/dataset_finale$mean_away_odd
dataset_finale$pxmean<-1/dataset_finale$mean_draw_odd
dataset_finale$p1max<-1/dataset_finale$max_home_odd
dataset_finale$p2max<-1/dataset_finale$max_away_odd
dataset_finale$pxmax<-1/dataset_finale$max_draw_odd
dataset_finale$esito<-NA
dataset_finale$esito<-ifelse(as.numeric(substr(dataset_finale$result,1,1))>as.numeric(substr(dataset_finale$result,3,3)),"1", ifelse(as.numeric(substr(dataset_finale$result,1,1))<as.numeric(substr(dataset_finale$result,3,3)),"2","X"))

#write.csv(dataset_finale,"dataset_finale_ita.csv")
dataset_finale<-read.table("dataset_finale_ita.csv", header = T, sep = ",")

#arbitraggio
dataset_finale<-dataset_finale[-which(is.na(dataset_finale$mean_home_odd)),]
dataset_finale$probtot<-dataset_finale$p1max+dataset_finale$p2max+dataset_finale$pxmax
sum(dataset_finale$probtot<1)

#rimuovo quote sballate
dataset_finale<-dataset_finale[-which(dataset_finale$probtot<0.9),]
sum(dataset_finale$probtot<1)#1238

#strategia arbitraggio
arb<-dataset_finale[which(dataset_finale$probtot<1),]
gain_arb<-c()
for (g in 1:nrow(arb)){
  gain_match<-100-(100/arb[g,"max_home_odd"])-(100/arb[g,"max_away_odd"])-(100/arb[g,"max_draw_odd"])
  gain_arb<-c(gain_arb, gain_match)
}
sum(gain_arb)#1771.25
1771.25/1238 #guadagno 1.43 a schedina
1-mean(dataset_finale$probtot[which(dataset_finale$probtot<1)])#1.43

#i bookmakers obbligano a investire interi di euro, perciò ho utilizzato round
gain_arb_real<-c()
for (f in 1:nrow(arb)){
  gain_match_real<-100-round(100/arb[f,"max_home_odd"])-round(100/arb[f,"max_away_odd"])-round(100/arb[f,"max_draw_odd"])
  gain_arb_real<-c(gain_arb_real, gain_match_real)
}
sum(gain_arb_real)#1825
1825/1238 #guadagno 1.47 a schedina

#prova primo metodo
#soglia 5%
dataset_finale$scomm1<-dataset_finale$scomm2<-dataset_finale$scommx<-NA
dataset_finale$scomm1<-ifelse(dataset_finale$p1mean>(dataset_finale$p1max+0.05),1,0)
dataset_finale$scomm2<-ifelse(dataset_finale$p2mean>(dataset_finale$p2max+0.05),1,0)
dataset_finale$scommx<-ifelse(dataset_finale$pxmean>(dataset_finale$pxmax+0.05),1,0)
sum(dataset_finale$scomm1)
sum(dataset_finale$scomm2)
sum(dataset_finale$scommx)

#strategia bookie
dsk<-dataset_finale[-which(dataset_finale$scomm1==0&dataset_finale$scomm2==0&dataset_finale$scommx==0),]
dsk$date<-as.character(dsk$date)
dsk$result<-as.character(dsk$result)
dsk$esito<-as.character(dsk$esito)
dsk$match<-as.character(dsk$match)
mat<-c()
sum(dsk$scomm1,dsk$scomm2,dsk$scommx)
for (i in 1:nrow(dsk)){
  if(dsk$scomm1[i]==1) mat<-rbind(mat, m1<-c(dsk$date[i], dsk$match[i], dsk$result[i], dsk$max_home_odd[i], dsk$max_away_odd[i], dsk$max_draw_odd[i], 1, 0, 0, dsk$esito[i], "1"))
  if(dsk$scomm2[i]==1) mat<-rbind(mat, m2<-c(dsk$date[i], dsk$match[i], dsk$result[i], dsk$max_home_odd[i], dsk$max_away_odd[i], dsk$max_draw_odd[i], 0, 1, 0, dsk$esito[i], "2"))
  if(dsk$scommx[i]==1) mat<-rbind(mat, mx<-c(dsk$date[i], dsk$match[i], dsk$result[i], dsk$max_home_odd[i], dsk$max_away_odd[i], dsk$max_draw_odd[i], 0, 0, 1, dsk$esito[i], "X"))
  print(i)
}
colnames(mat)<-c("date", "match", "score", "max_odds_home_win", "max_odds_away_win", "max_odds_draw", "scomm1", "scomm2", "scommx", "esito", "punt")
mat1<-matrix(NA,nrow(mat),3)
mat1[,1]<-as.numeric(mat[,4])
mat1[,2]<-as.numeric(mat[,5])
mat1[,3]<-as.numeric(mat[,6])
mat<-as.data.frame(mat[,-c(4,5,6)])
mat$max_odds_home_win<-mat1[,1]
mat$max_odds_away_win<-mat1[,2]
mat$max_odds_draw<-mat1[,3]
mat$gain<-NA
for (j in 1:nrow(mat)){
  mat$gain[j]<-ifelse(mat$esito[j]!=mat$punt[j], -50, ifelse(mat$punt[j]=="1", 50*mat$max_odds_home_win[j]-50, ifelse(mat$punt[j]=="2", 50*mat$max_odds_away_win[j]-50, 50*mat$max_odds_draw[j]-50)))
  print(j)
}
(gain_stategy<-cumsum(mat$gain)[j])#914.5
914.5/89 #guadagno 10.28 a schedina
c(sum(mat$gain[which(mat$scomm1==1)]),sum(mat$gain[which(mat$scomm2==1)]),sum(mat$gain[which(mat$scommx==1)]))
#guadagno soprattutto con le partite fuori casa
#=>bilancio

#strategia casuale
proporzioni<-prop.table(table(dataset_finale$esito))
guadagno<-matrix(NA,j,100)
for (k in 1:100){
  s<-sample(1:nrow(dataset_finale),nrow(mat))
  pr<-sample(c("1","2","X"), nrow(mat), replace = T, prob = proporzioni)
  contatore<-ifelse(dataset_finale[s,"esito"]!=pr, -50, ifelse(dataset_finale[s,"esito"]=="1", 50*dataset_finale$max_home_odd[s]-50, ifelse(dataset_finale[s,"esito"]=="2", 50*dataset_finale$max_away_odd[s]-50, 50*dataset_finale$max_draw_odd[s]-50)))
  guadagno[,k]<-contatore
  print(k)
}
b<-c()
for (l in 1:100){
  a<-cumsum(guadagno[,l])[j]
  b<-c(b,a) 
};
(gain_casual<-mean(b))

#aumento numero partite
diff<-proporzioni-c(mean(dataset_finale$p1mean),mean(dataset_finale$p2mean),mean(dataset_finale$pxmean))
dataset_finale$scomm1_<-dataset_finale$scomm2_<-dataset_finale$scommx_<-NA
dataset_finale$scomm1_<-ifelse(dataset_finale$p1mean>(dataset_finale$p1max-diff[1]+0.025),1,0)
dataset_finale$scomm2_<-ifelse(dataset_finale$p2mean>(dataset_finale$p2max-diff[2]+0.025),1,0)
dataset_finale$scommx_<-ifelse(dataset_finale$pxmean>(dataset_finale$pxmax-diff[3]+0.025),1,0)
sum(dataset_finale$scomm1_)
sum(dataset_finale$scomm2_)
sum(dataset_finale$scommx_)
#strategia bookie
dsk_<-dataset_finale[-which(dataset_finale$scomm1_==0&dataset_finale$scomm2_==0&dataset_finale$scommx_==0),]
dsk_$date<-as.character(dsk_$date)
dsk_$result<-as.character(dsk_$result)
dsk_$esito<-as.character(dsk_$esito)
dsk_$match<-as.character(dsk_$match)
mat_<-c()
for (i in 1:nrow(dsk_)){
  if(dsk_$scomm1_[i]==1) mat_<-rbind(mat_, m1<-c(dsk_$date[i], dsk_$match[i], dsk_$result[i], dsk_$max_home_odd[i], dsk_$max_away_odd[i], dsk_$max_draw_odd[i], 1, 0, 0, dsk_$esito[i], "1"))
  if(dsk_$scomm2_[i]==1) mat_<-rbind(mat_, m2<-c(dsk_$date[i], dsk_$match[i], dsk_$result[i], dsk_$max_home_odd[i], dsk_$max_away_odd[i], dsk_$max_draw_odd[i], 0, 1, 0, dsk_$esito[i], "2"))
  if(dsk_$scommx_[i]==1) mat_<-rbind(mat_, mx<-c(dsk_$date[i], dsk_$match[i], dsk_$result[i], dsk_$max_home_odd[i], dsk_$max_away_odd[i], dsk_$max_draw_odd[i], 0, 0, 1, dsk_$esito[i], "X"))
  print(i)
}
colnames(mat_)<-c("date", "match", "score", "max_odds_home_win", "max_odds_away_win", "max_odds_draw", "scomm1", "scomm2", "scommx", "esito", "punt")
mat2<-matrix(NA,nrow(mat_),3)
mat2[,1]<-as.numeric(mat_[,4])
mat2[,2]<-as.numeric(mat_[,5])
mat2[,3]<-as.numeric(mat_[,6])
mat_<-as.data.frame(mat_[,-c(4,5,6)])
mat_$max_odds_home_win<-mat2[,1]
mat_$max_odds_away_win<-mat2[,2]
mat_$max_odds_draw<-mat2[,3]
mat_$gain<-NA
for (j in 1:nrow(mat_)){
  mat_$gain[j]<-ifelse(mat_$esito[j]!=mat_$punt[j], -50, ifelse(mat_$punt[j]=="1", 50*mat_$max_odds_home_win[j]-50, ifelse(mat_$punt[j]=="2", 50*mat_$max_odds_away_win[j]-50, 50*mat_$max_odds_draw[j]-50)))
  print(j)
}
(gain_stategy2<-cumsum(mat_$gain)[j])#1756
1756/131 #guadagno 13.40 a schedina

#strategia se puntassi sempre il favorito
dataset_finale$punt1<-ifelse(dataset_finale$p1mean>dataset_finale$p2mean & dataset_finale$p1mean>dataset_finale$pxmean, 1,0)
dataset_finale$punt2<-ifelse(dataset_finale$p2mean>dataset_finale$p1mean & dataset_finale$p2mean>dataset_finale$pxmean, 1,0)
dataset_finale$puntx<-ifelse(dataset_finale$pxmean>dataset_finale$p1mean & dataset_finale$pxmean>dataset_finale$p2mean, 1,0)
dataset_finale$punt2[1145]<-1
dataset_finale$guadagno<-ifelse(dataset_finale$esito=="1", 50*dataset_finale$punt1*dataset_finale$max_home_odd-50, ifelse(dataset_finale$esito=="2", 50*dataset_finale$punt2*dataset_finale$max_away_odd-50, 50*dataset_finale$puntx*dataset_finale$max_draw_odd-50))
cumsum(dataset_finale$guadagno)[nrow(dataset_finale)] #3630
3630/1973 #guadagno 1.84 a schedina
#guadagno anche puntando sempre sul favorito, però con 500k partite è falso

#voglio più o meno rispettare le proporzioni, allora mi chiedo a che soglia sia giusto mettere il pareggio
dataset_finale$phw<-dataset_finale$p1mean-dataset_finale$p2mean
prop.table(table(round(dataset_finale$pxmean,2),dataset_finale$esito),1)
#1 872, 2 600, X 501
dataset_finale$ps<-NA
dataset_finale[order(dataset_finale$phw)[1:600],"ps"]<-"2"
dataset_finale[order(dataset_finale$phw)[601:1101],"ps"]<-"X"
dataset_finale[order(dataset_finale$phw)[1102:1973],"ps"]<-"1"
dataset_finale$gainps<-ifelse(dataset_finale$ps!=dataset_finale$esito, -50, ifelse(dataset_finale$ps=="1",dataset_finale$max_home_odd*50-50,ifelse(dataset_finale$ps=="2", dataset_finale$max_away_odd*50-50,dataset_finale$max_draw_odd*50-50)))
cumsum(dataset_finale$gainps)[nrow(dataset_finale)] #7411.5
7411/1973 #guadagno 3.76 a schedina
#guadagno il doppio rispetto a puntare sul favorito

#strategia x
#il pareggio si verifica in 1/4 dei casi, => invece che usare la strategia del raddoppio che comporta grandi perdite prima di avere grandi guadagni
#utilizziamo una funzione crescente del guadagno, aumentando gradualmente l'importo
strat_x<-dataset_finale[which(dataset_finale$mean_draw_odd<4&dataset_finale$mean_draw_odd>3),]
strat_x<-strat_x[order(strat_x$date),]
a<-c()
b<-0
d<-c()
for (i in 1:100000){
  if (3*i-i-sum(a)>b)  {b<-3*i-i-sum(a);c<-i;a<-c(a,c);d<-c(d,b)}
}
sxg<-c()
j<-1
for (i in 1:nrow(strat_x)){
  sxg[i]<-ifelse(strat_x$esito[i]=="X", a[j]*strat_x$max_draw_odd[i]-a[j],-a[j])
  ifelse(strat_x$esito[i]!="X", j<-j+1,j<-1)
  if(i>(nrow(strat_x)-25) & strat_x$esito[i]=="X") {break}
}
cumsum(sxg)[1324]#guadagno 9166.28
min(cumsum(sxg))#arrivo a perdere 4663.87 verso la fine
#ho notevolmente ridotto la perdita, ma comunque necessito di troppo capitale

#provo con un guadagno fisso
e<-c()
f<-0
g<-c()
for (i in 1:100000){
  if (3*i-i-sum(e)>0)  {f<-3*i-i-sum(e);h<-i;e<-c(e,h);g<-c(g,f)}
}
sxg<-c()
j<-1
for (i in 1:nrow(strat_x)){
  sxg[i]<-ifelse(strat_x$esito[i]=="X", e[j]*strat_x$max_draw_odd[i]-e[j],-e[j])
  ifelse(strat_x$esito[i]!="X", j<-j+1,j<-1)
  if(i>(nrow(strat_x)-25) & strat_x$esito[i]=="X") {break}
}
cumsum(sxg)[1324]#guadagno 4376.77
min(cumsum(sxg))#perdo 2254.01
#anche riducendo perdo troppo
#questo metodo può essere utilizzato per un campione ridotto di partite, non va bene