dati_elo<-read.csv("elo_fine.csv", sep=";", header = T)
dataset_finale<-read.csv("dataset_finale_ita.csv", header = T, sep = ",")
dataset_finale<-dataset_finale[-which(is.na(dataset_finale$mean_home_odd)),]
dataset_finale$probtot<-dataset_finale$p1max+dataset_finale$p2max+dataset_finale$pxmax
dataset_finale<-dataset_finale[-which(dataset_finale$probtot<0.9),]
dati_elo$Data<-as.Date(dati_elo$Data, format="%d/%m/%Y")
dataset_finale$date<-as.Date(dataset_finale$date, format="%d/%m/%Y")
dataset_finale$match<-as.character(dataset_finale$match)
a<-strsplit(dataset_finale$match,"-")
dataset_finale$home_team<-NA
dataset_finale$away_team<-NA
for (i in 1:nrow(dataset_finale)){
  dataset_finale$home_team[i]<-a[[i]][1]
  dataset_finale$away_team[i]<-a[[i]][2]
}
dataset_finale$home_team<-as.factor(dataset_finale$home_team)
dati_elo$H_team<-as.character(dati_elo$H_team)
dati_elo$H_team[which(dati_elo$H_team=="ACF Fiorentina")]<-"Fiorentina"
dati_elo$H_team[which(dati_elo$H_team=="Benevento Calcio")]<-"Benevento"
dati_elo$H_team[which(dati_elo$H_team=="Bologna FC")]<-"Bologna"
dati_elo$H_team[which(dati_elo$H_team=="Brescia Calcio")]<-"Brescia"
dati_elo$H_team[which(dati_elo$H_team=="Cagliari Calcio")]<-"Cagliari"
dati_elo$H_team[which(dati_elo$H_team=="Carpi FC")]<-"Carpi"
dati_elo$H_team[which(dati_elo$H_team=="Chievo Verona")]<-"Chievo"
dati_elo$H_team[which(dati_elo$H_team=="Empoli FC")]<-"Empoli"
dati_elo$H_team[which(dati_elo$H_team=="FC Crotone")]<-"Crotone"
dati_elo$H_team[which(dati_elo$H_team=="Frosinone Calcio")]<-"Frosinone"
dati_elo$H_team[which(dati_elo$H_team=="Genoa CFC")]<-"Genoa"
dati_elo$H_team[which(dati_elo$H_team=="Hellas Verona")]<-"Verona"
dati_elo$H_team[which(dati_elo$H_team=="Lazio Roma")]<-"Lazio"
dati_elo$H_team[which(dati_elo$H_team=="Parma Calcio 1913")]<-"Parma"
dati_elo$H_team[which(dati_elo$H_team=="Pescara Calcio")]<-"Pescara"
dati_elo$H_team[which(dati_elo$H_team=="Sassuolo Calcio")]<-"Sassuolo"
dati_elo$H_team[which(dati_elo$H_team=="SPAL 2013 Ferrara")]<-"Spal"
dati_elo$H_team[which(dati_elo$H_team=="SSC Napoli")]<-"Napoli"
dati_elo$H_team[which(dati_elo$H_team=="Torino FC")]<-"Torino"
dati_elo$H_team[which(dati_elo$H_team=="Udinese Calcio")]<-"Udinese"
dati_elo$H_team[which(dati_elo$H_team=="US Lecce")]<-"Lecce"
dati_elo$H_team[which(dati_elo$H_team=="US Palermo")]<-"Palermo"
dati_elo$H_team<-as.factor(dati_elo$H_team)
levels(dataset_finale$home_team)
levels(dati_elo$H_team)
dati_elo$H_team[1]==dataset_finale$home_team
b<-c()
for (i in 1:nrow(dataset_finale)){
  for (j in 1:nrow(dati_elo))
    if (dataset_finale$home_team[i]==dati_elo$H_team[j] & dataset_finale$date[i]==dati_elo$Data[j]) {c<-c(i,which(dataset_finale$home_team[i]==dati_elo$H_team & dataset_finale$date[i]==dati_elo$Data));b<-rbind(b,c)}
  print(i)
}
new_elo<-as.data.frame(b)
new_elo$match<-dataset_finale$match[new_elo$V1]
new_elo$date<-dataset_finale$date[new_elo$V1]
new_elo$mean_home_odd<-dataset_finale$mean_home_odd[new_elo$V1]
new_elo$mean_away_odd<-dataset_finale$mean_away_odd[new_elo$V1]
new_elo$mean_draw_odd<-dataset_finale$mean_draw_odd[new_elo$V1]
new_elo$max_home_odd<-dataset_finale$max_home_odd[new_elo$V1]
new_elo$max_away_odd<-dataset_finale$max_away_odd[new_elo$V1]
new_elo$max_draw_odd<-dataset_finale$max_draw_odd[new_elo$V1]
new_elo$result<-dataset_finale$result[new_elo$V1]
new_elo$esito<-dataset_finale$esito[new_elo$V1]
new_elo$p1max<-dataset_finale$p1max[new_elo$V1]
new_elo$p2max<-dataset_finale$p2max[new_elo$V1]
new_elo$pxmax<-dataset_finale$pxmax[new_elo$V1]
new_elo$elo1<-dati_elo$X1_prob_elo[new_elo$V2]/100
new_elo$elo2<-dati_elo$X2_prob_elo[new_elo$V2]/100
new_elo$elox<-dati_elo$X_prob_elo[new_elo$V2]/100

#soglia 5% elo
new_elo$scomm1<-new_elo$scomm2<-new_elo$scommx<-NA
new_elo$scomm1<-ifelse(new_elo$elo1>(new_elo$p1max+0.05),1,0)
new_elo$scomm2<-ifelse(new_elo$elo2>(new_elo$p2max+0.05),1,0)
new_elo$scommx<-ifelse(new_elo$elox>(new_elo$pxmax+0.05),1,0)
sum(new_elo$scomm1)
sum(new_elo$scomm2)
sum(new_elo$scommx)

#strategia bookie
dsk<-new_elo[-which(new_elo$scomm1==0&new_elo$scomm2==0&new_elo$scommx==0),]
dsk$date<-as.character(dsk$date)
dsk$result<-as.character(dsk$result)
dsk$esito<-as.character(dsk$esito)
mat<-c()
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
(gain_stategy<-cumsum(mat$gain)[j])#-1727
-1727/777 #perdita 2.22 a schedina
c(sum(mat$gain[which(mat$scomm1==1)]),sum(mat$gain[which(mat$scomm2==1)]),sum(mat$gain[which(mat$scommx==1)]))
#in casa perdo, fuori guadagno e tanto
#bilancio quote

#differenzio
diff<-prop.table(table(dataset_finale$esito))-c(mean(dataset_finale$p1mean),mean(dataset_finale$p2mean),mean(dataset_finale$pxmean))
new_elo$scomm1_diff<-new_elo$scomm2_diff<-new_elo$scommx_diff<-NA
new_elo$scomm1_diff<-ifelse(new_elo$elo1>(new_elo$p1max+0.03-diff[1]),1,0)
new_elo$scomm2_diff<-ifelse(new_elo$elo2>(new_elo$p2max+0.03-diff[2]),1,0)
new_elo$scommx_diff<-ifelse(new_elo$elox>(new_elo$pxmax+0.03-diff[3]),1,0)
sum(new_elo$scomm1_diff)
sum(new_elo$scomm2_diff)
sum(new_elo$scommx_diff)
dsk_diff<-new_elo[-which(new_elo$scomm1_diff==0&new_elo$scomm2_diff==0&new_elo$scommx_diff==0),]
dsk_diff$date<-as.character(dsk_diff$date)
dsk_diff$result<-as.character(dsk_diff$result)
dsk_diff$esito<-as.character(dsk_diff$esito)
mat_diff<-c()
for (i in 1:nrow(dsk_diff)){
  if(dsk_diff$scomm1_diff[i]==1) mat_diff<-rbind(mat_diff, m1<-c(dsk_diff$date[i], dsk_diff$match[i], dsk_diff$result[i], dsk_diff$max_home_odd[i], dsk_diff$max_away_odd[i], dsk_diff$max_draw_odd[i], 1, 0, 0, dsk_diff$esito[i], "1"))
  if(dsk_diff$scomm2_diff[i]==1) mat_diff<-rbind(mat_diff, m2<-c(dsk_diff$date[i], dsk_diff$match[i], dsk_diff$result[i], dsk_diff$max_home_odd[i], dsk_diff$max_away_odd[i], dsk_diff$max_draw_odd[i], 0, 1, 0, dsk_diff$esito[i], "2"))
  if(dsk_diff$scommx_diff[i]==1) mat_diff<-rbind(mat_diff, mx<-c(dsk_diff$date[i], dsk_diff$match[i], dsk_diff$result[i], dsk_diff$max_home_odd[i], dsk_diff$max_away_odd[i], dsk_diff$max_draw_odd[i], 0, 0, 1, dsk_diff$esito[i], "X"))
  print(i)
}
colnames(mat_diff)<-c("date", "match", "score", "max_odds_home_win", "max_odds_away_win", "max_odds_draw", "scomm1", "scomm2", "scommx", "esito", "punt")
mat_diff1<-matrix(NA,nrow(mat_diff),3)
mat_diff1[,1]<-as.numeric(mat_diff[,4])
mat_diff1[,2]<-as.numeric(mat_diff[,5])
mat_diff1[,3]<-as.numeric(mat_diff[,6])
mat_diff<-as.data.frame(mat_diff[,-c(4,5,6)])
mat_diff$max_odds_home_win<-mat_diff1[,1]
mat_diff$max_odds_away_win<-mat_diff1[,2]
mat_diff$max_odds_draw<-mat_diff1[,3]
mat_diff$gain<-NA
for (j in 1:nrow(mat_diff)){
  mat_diff$gain[j]<-ifelse(mat_diff$esito[j]!=mat_diff$punt[j], -50, ifelse(mat_diff$punt[j]=="1", 50*mat_diff$max_odds_home_win[j]-50, ifelse(mat_diff$punt[j]=="2", 50*mat_diff$max_odds_away_win[j]-50, 50*mat_diff$max_odds_draw[j]-50)))
  print(j)
}
(gain_stategy<-cumsum(mat_diff$gain)[j])#-2915
-2915/790 #perdita 3.68 a schedina
c(sum(mat_diff$gain[which(mat_diff$scomm1==1)]),sum(mat_diff$gain[which(mat_diff$scomm2==1)]),sum(mat_diff$gain[which(mat_diff$scommx==1)]))