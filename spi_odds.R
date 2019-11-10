dati_spi<-read.csv("spi_matches.csv", sep=",", header = T)
dati_ita<-dati_spi[which(dati_spi$league=="Italy Serie A"),]
dati_ita$Esiti<-ifelse(dati_ita$score1>dati_ita$score2, "1", ifelse(dati_ita$score1==dati_ita$score2, "X", "2"))
dataset_finale<-read.csv("dataset_finale_ita.csv", header = T, sep = ",")
dataset_finale<-dataset_finale[-which(is.na(dataset_finale$mean_home_odd)),]
dataset_finale$probtot<-dataset_finale$p1max+dataset_finale$p2max+dataset_finale$pxmax
dataset_finale<-dataset_finale[-which(dataset_finale$probtot<0.9),]
dati_ita$date<-as.Date(dati_ita$date)
dataset_finale$date<-as.Date(dataset_finale$date, format="%d/%m/%Y")
sum(dataset_finale$date[100]==dati_ita$date)
dataset_finale$match<-as.character(dataset_finale$match)
a<-strsplit(dataset_finale$match,"-")
dataset_finale$home_team<-NA
dataset_finale$away_team<-NA
for (i in 1:nrow(dataset_finale)){
  dataset_finale$home_team[i]<-a[[i]][1]
  dataset_finale$away_team[i]<-a[[i]][2]
}
dataset_finale$home_team<-as.factor(dataset_finale$home_team)
dati_ita$team1<-as.character(dati_ita$team1)
dati_ita$team1[which(dati_ita$team1=="Chievo Verona")]<-"Chievo"
dati_ita$team1[which(dati_ita$team1=="Internazionale")]<-"Inter"
dati_ita$team1[which(dati_ita$team1=="US Pescara")]<-"Pescara"
dati_ita$team1<-as.factor(dati_ita$team1)
levels(dataset_finale$home_team)
levels(dati_ita$team1)
dati_ita$team1[1]==dataset_finale$home_team
b<-c()
for (i in 1:nrow(dataset_finale)){
  for (j in 1:nrow(dati_ita))
 if (dataset_finale$home_team[i]==dati_ita$team1[j] & dataset_finale$date[i]==dati_ita$date[j]) {c<-c(i,which(dataset_finale$home_team[i]==dati_ita$team1 & dataset_finale$date[i]==dati_ita$date));b<-rbind(b,c)}
 print(i)
}
new_spi<-as.data.frame(b)
new_spi$match<-dataset_finale$match[new_spi$V1]
new_spi$date<-dataset_finale$date[new_spi$V1]
new_spi$mean_home_odd<-dataset_finale$mean_home_odd[new_spi$V1]
new_spi$mean_away_odd<-dataset_finale$mean_away_odd[new_spi$V1]
new_spi$mean_draw_odd<-dataset_finale$mean_draw_odd[new_spi$V1]
new_spi$max_home_odd<-dataset_finale$max_home_odd[new_spi$V1]
new_spi$max_away_odd<-dataset_finale$max_away_odd[new_spi$V1]
new_spi$max_draw_odd<-dataset_finale$max_draw_odd[new_spi$V1]
new_spi$result<-dataset_finale$result[new_spi$V1]
new_spi$esito<-dataset_finale$esito[new_spi$V1]
new_spi$p1max<-dataset_finale$p1max[new_spi$V1]
new_spi$p2max<-dataset_finale$p2max[new_spi$V1]
new_spi$pxmax<-dataset_finale$pxmax[new_spi$V1]
new_spi$spi1<-dati_ita$prob1[new_spi$V2]
new_spi$spi2<-dati_ita$prob2[new_spi$V2]
new_spi$spix<-dati_ita$probtie[new_spi$V2]

#soglia 5% spi
new_spi$scomm1<-new_spi$scomm2<-new_spi$scommx<-NA
new_spi$scomm1<-ifelse(new_spi$spi1>(new_spi$p1max+0.05),1,0)
new_spi$scomm2<-ifelse(new_spi$spi2>(new_spi$p2max+0.05),1,0)
new_spi$scommx<-ifelse(new_spi$spix>(new_spi$pxmax+0.05),1,0)
sum(new_spi$scomm1)
sum(new_spi$scomm2)
sum(new_spi$scommx)

#strategia bookie
dsk<-new_spi[-which(new_spi$scomm1==0&new_spi$scomm2==0&new_spi$scommx==0),]
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
(gain_stategy<-cumsum(mat$gain)[j])#-2399
-2399/473 #perdita 5.07 a schedina
c(sum(mat$gain[which(mat$scomm1==1)]),sum(mat$gain[which(mat$scomm2==1)]),sum(mat$gain[which(mat$scommx==1)]))
#in casa perdo, fuori guadagno
#bilancio quote

#differenzio
diff<-prop.table(table(dataset_finale$esito))-c(mean(dataset_finale$p1mean),mean(dataset_finale$p2mean),mean(dataset_finale$pxmean))
new_spi$scomm1_diff<-new_spi$scomm2_diff<-new_spi$scommx_diff<-NA
new_spi$scomm1_diff<-ifelse(new_spi$spi1>(new_spi$p1max+0.03-diff[1]),1,0)
new_spi$scomm2_diff<-ifelse(new_spi$spi2>(new_spi$p2max+0.03-diff[2]),1,0)
new_spi$scommx_diff<-ifelse(new_spi$spix>(new_spi$pxmax+0.03-diff[3]),1,0)
sum(new_spi$scomm1_diff)
sum(new_spi$scomm2_diff)
sum(new_spi$scommx_diff)
dsk_diff<-new_spi[-which(new_spi$scomm1_diff==0&new_spi$scomm2_diff==0&new_spi$scommx_diff==0),]
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
(gain_stategy<-cumsum(mat_diff$gain)[j])#-2182
-2182/492 #perdita 4.43 a schedina
c(sum(mat_diff$gain[which(mat_diff$scomm1==1)]),sum(mat_diff$gain[which(mat_diff$scomm2==1)]),sum(mat_diff$gain[which(mat_diff$scommx==1)]))