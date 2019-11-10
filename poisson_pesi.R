dati_poi<-read.csv("elo_fine.csv", sep=";", header = T)
mediaHfatti<-mediaHsubiti<-mediaAfatti<-mediaAsubiti<-mediaHtot<-mediaAtot<-c()
for (i in 1:1492){
  #fatti e subiti h
  mat1<-subset(dati_poi, H_team==H_team[i])[,c(7,8)]
  mat2<-subset(dati_poi, A_team==H_team[i])[,c(7,8)]
  gol_fatti_ultime_h1<-mat1[as.numeric(row.names(mat1))>i & as.numeric(row.names(mat1))<i+100,1]
  gol_subiti_ultime_h1<-mat1[as.numeric(row.names(mat1))>i & as.numeric(row.names(mat1))<i+100,2]
  gol_fatti_ultime_h2<-mat2[as.numeric(row.names(mat2))>i & as.numeric(row.names(mat2))<i+100,2]
  gol_subiti_ultime_h2<-mat2[as.numeric(row.names(mat2))>i & as.numeric(row.names(mat2))<i+100,1]
  mediaHfatti[i]<-ifelse((sum(NROW(gol_fatti_ultime_h1))+sum(NROW(gol_fatti_ultime_h2)))<5,0,(sum(gol_fatti_ultime_h1)+sum(gol_fatti_ultime_h2))/(sum(NROW(gol_fatti_ultime_h1))+sum(NROW(gol_fatti_ultime_h2))))
  mediaHsubiti[i]<-ifelse((sum(NROW(gol_subiti_ultime_h1))+sum(NROW(gol_subiti_ultime_h2)))<5,0,(sum(gol_subiti_ultime_h1)+sum(gol_subiti_ultime_h2))/(sum(NROW(gol_subiti_ultime_h1))+sum(NROW(gol_subiti_ultime_h2))))
  #fatti e subiti a
  mat3<-subset(dati_poi, H_team==A_team[i])[,c(7,8)]
  mat4<-subset(dati_poi, A_team==A_team[i])[,c(7,8)]
  gol_fatti_ultime_a1<-mat3[as.numeric(row.names(mat3))>i & as.numeric(row.names(mat3))<i+100,1]
  gol_subiti_ultime_a1<-mat3[as.numeric(row.names(mat3))>i & as.numeric(row.names(mat3))<i+100,2]
  gol_fatti_ultime_a2<-mat4[as.numeric(row.names(mat4))>i & as.numeric(row.names(mat4))<i+100,2]
  gol_subiti_ultime_a2<-mat4[as.numeric(row.names(mat4))>i & as.numeric(row.names(mat4))<i+100,1]
  mediaAfatti[i]<-ifelse((sum(NROW(gol_fatti_ultime_a1))+sum(NROW(gol_fatti_ultime_a2)))<5,0,(sum(gol_fatti_ultime_a1)+sum(gol_fatti_ultime_a2))/(sum(NROW(gol_fatti_ultime_a1))+sum(NROW(gol_fatti_ultime_a2))))
  mediaAsubiti[i]<-ifelse((sum(NROW(gol_subiti_ultime_a1))+sum(NROW(gol_subiti_ultime_a2)))<5,0,(sum(gol_subiti_ultime_a1)+sum(gol_subiti_ultime_a2))/(sum(NROW(gol_subiti_ultime_a1))+sum(NROW(gol_subiti_ultime_a2))))
  #media gol casa e trasferta
  mediaHtot[i]<-mean(dati_poi[(i+1):(i+100),7])
  mediaAtot[i]<-mean(dati_poi[(i+1):(i+100),8])
}
#moltiplico gol fatti squadra in casa x gol subiti squadra fuori x media gol in casa campionato
#moltiplico gol fatti squadra fuori x gol subiti squadra in casa x media gol fuori campionato
#ottengo 2 medie che andrò a confrontare con distribuzione poisson
dati_poi$fattiH<-dati_poi$subitiH<-dati_poi$fattiA<-dati_poi$subitiA<-dati_poi$fattiHtot<-dati_poi$fattiAtot<-dati_poi$lamh<-dati_poi$lama<-NA
contatore<-which(mediaAfatti!=0 & mediaAsubiti!=0 & mediaHsubiti!=0 & mediaHfatti!=0)
dati_poi<-dati_poi[contatore,]
dati_poi$Data<-as.Date(dati_poi$Data, format="%d/%m/%Y")

#modifico il dataset con le quote
dataset_finale<-read.csv("dataset_finale_ita.csv", header = T, sep = ",")
dataset_finale<-dataset_finale[-which(is.na(dataset_finale$mean_home_odd)),]
dataset_finale$probtot<-dataset_finale$p1max+dataset_finale$p2max+dataset_finale$pxmax
dataset_finale<-dataset_finale[-which(dataset_finale$probtot<0.9),]
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

#accorpo i due dataset
dati_poi$H_team<-as.character(dati_poi$H_team)
dati_poi$H_team[which(dati_poi$H_team=="ACF Fiorentina")]<-"Fiorentina"
dati_poi$H_team[which(dati_poi$H_team=="Benevento Calcio")]<-"Benevento"
dati_poi$H_team[which(dati_poi$H_team=="Bologna FC")]<-"Bologna"
dati_poi$H_team[which(dati_poi$H_team=="Brescia Calcio")]<-"Brescia"
dati_poi$H_team[which(dati_poi$H_team=="Cagliari Calcio")]<-"Cagliari"
dati_poi$H_team[which(dati_poi$H_team=="Carpi FC")]<-"Carpi"
dati_poi$H_team[which(dati_poi$H_team=="Chievo Verona")]<-"Chievo"
dati_poi$H_team[which(dati_poi$H_team=="Empoli FC")]<-"Empoli"
dati_poi$H_team[which(dati_poi$H_team=="FC Crotone")]<-"Crotone"
dati_poi$H_team[which(dati_poi$H_team=="Frosinone Calcio")]<-"Frosinone"
dati_poi$H_team[which(dati_poi$H_team=="Genoa CFC")]<-"Genoa"
dati_poi$H_team[which(dati_poi$H_team=="Hellas Verona")]<-"Verona"
dati_poi$H_team[which(dati_poi$H_team=="Lazio Roma")]<-"Lazio"
dati_poi$H_team[which(dati_poi$H_team=="Parma Calcio 1913")]<-"Parma"
dati_poi$H_team[which(dati_poi$H_team=="Pescara Calcio")]<-"Pescara"
dati_poi$H_team[which(dati_poi$H_team=="Sassuolo Calcio")]<-"Sassuolo"
dati_poi$H_team[which(dati_poi$H_team=="SPAL 2013 Ferrara")]<-"Spal"
dati_poi$H_team[which(dati_poi$H_team=="SSC Napoli")]<-"Napoli"
dati_poi$H_team[which(dati_poi$H_team=="Torino FC")]<-"Torino"
dati_poi$H_team[which(dati_poi$H_team=="Udinese Calcio")]<-"Udinese"
dati_poi$H_team[which(dati_poi$H_team=="US Lecce")]<-"Lecce"
dati_poi$H_team[which(dati_poi$H_team=="US Palermo")]<-"Palermo"
dati_poi$H_team<-as.factor(dati_poi$H_team)
q<-c()
for (i in 1:nrow(dataset_finale)){
  for (j in 1:nrow(dati_poi))
    if (dataset_finale$home_team[i]==dati_poi$H_team[j] & dataset_finale$date[i]==dati_poi$Data[j]) {x<-c(i,which(dataset_finale$home_team[i]==dati_poi$H_team & dataset_finale$date[i]==dati_poi$Data));q<-rbind(q,x)}
}
new_pois<-as.data.frame(q)
new_pois$match<-dataset_finale$match[new_pois$V1]
new_pois$date<-dataset_finale$date[new_pois$V1]
new_pois$mean_home_odd<-dataset_finale$mean_home_odd[new_pois$V1]
new_pois$mean_away_odd<-dataset_finale$mean_away_odd[new_pois$V1]
new_pois$mean_draw_odd<-dataset_finale$mean_draw_odd[new_pois$V1]
new_pois$max_home_odd<-dataset_finale$max_home_odd[new_pois$V1]
new_pois$max_away_odd<-dataset_finale$max_away_odd[new_pois$V1]
new_pois$max_draw_odd<-dataset_finale$max_draw_odd[new_pois$V1]
new_pois$result<-dataset_finale$result[new_pois$V1]
new_pois$esito<-dataset_finale$esito[new_pois$V1]
new_pois$p1max<-dataset_finale$p1max[new_pois$V1]
new_pois$p2max<-dataset_finale$p2max[new_pois$V1]
new_pois$pxmax<-dataset_finale$pxmax[new_pois$V1]

#ci metto tutti i pesi e creo il le colonne di probabilità
a<-seq(0.01,0.98,by=0.01)
c<-c()
s<-c()

for (i in a) {
  for (j in a) {
    for (k in a) {
      if(i+j+k==1) {b<-c(i,j,k);c<-rbind(c,b)}
    }
  }
}
for (i in 1:nrow(dati_poi)){
  dati_poi$fattiAtot[i]<-mediaAtot[i]
  dati_poi$fattiHtot[i]<-mediaHtot[i]
  dati_poi$subitiA[i]<-mediaAsubiti[i]
  dati_poi$fattiA[i]<-mediaAfatti[i]
  dati_poi$subitiH[i]<-mediaHsubiti[i]
  dati_poi$fattiH[i]<-mediaHfatti[i]
}  

#inizio il ciclo
for (h in 1:nrow(c)){
#devo cancellare ogni volta la nuova variabile creata
  new_pois$poi1<-NA
  new_pois$poi2<-NA
  new_pois$poix<-NA
dati_poi$X1_prob_poi<-dati_poi$X2_prob_poi<-dati_poi$X_prob_poi<-NA
d<-c()
for (i in 1:nrow(dati_poi)){
  #ricreo ogni volta la poisson con pesi diversi
  dati_poi$lamh[i]<-sum(dati_poi$fattiHtot[i]*c[h,1],dati_poi$fattiH[i]*c[h,2],dati_poi$subitiA[i]*c[h,3])
  dati_poi$lama[i]<-sum(dati_poi$fattiAtot[i]*c[h,1],dati_poi$fattiA[i]*c[h,2],dati_poi$subitiH[i]*c[h,3])
gol1<-gol2<-p_vinc1<-p_vinc2<-c()
  for (ku in 0:7){
    gol1[ku+1]<-dpois(ku,dati_poi$lamh[i])
    gol2[ku+1]<-dpois(ku,dati_poi$lama[i])
    p_vinc1[ku+1]<-(1-ppois(ku,dati_poi$lamh[i]))
    p_vinc2[ku+1]<-(1-ppois(ku,dati_poi$lama[i]))
  }
  dati_poi$X_prob_poi[i]<-sum(gol1*gol2)
  dati_poi$X1_prob_poi[i]<-sum(p_vinc1*gol2)
  dati_poi$X2_prob_poi[i]<-sum(p_vinc2*gol1)
}
#inserisco le nuove variabili nel dataset new_poi
new_pois$pois1<-dati_poi$X1_prob_poi[new_pois$V2]
new_pois$pois2<-dati_poi$X2_prob_poi[new_pois$V2]
new_pois$poisx<-dati_poi$X_prob_poi[new_pois$V2]
#decido quando scommettere
new_pois$scomm1<-new_pois$scomm2<-new_pois$scommx<-NA
new_pois$scomm1<-ifelse(new_pois$pois1>(new_pois$p1max+0.05),1,0)
new_pois$scomm2<-ifelse(new_pois$pois2>(new_pois$p2max+0.05),1,0)
new_pois$scommx<-ifelse(new_pois$poisx>(new_pois$pxmax+0.05),1,0)
#strategia bookie
dsk<-new_pois[-which(new_pois$scomm1==0&new_pois$scomm2==0&new_pois$scommx==0),]
dsk$result<-as.character(dsk$result)
dsk$esito<-as.character(dsk$esito)
mat<-c()
for (p in 1:nrow(dsk)){
  if(dsk$scomm1[p]==1) mat<-rbind(mat, m1<-c(dsk$result[p], dsk$max_home_odd[p], dsk$max_away_odd[p], dsk$max_draw_odd[p], 1, 0, 0, dsk$esito[p], "1"))
  if(dsk$scomm2[p]==1) mat<-rbind(mat, m2<-c(dsk$result[p], dsk$max_home_odd[p], dsk$max_away_odd[p], dsk$max_draw_odd[p], 0, 1, 0, dsk$esito[p], "2"))
  if(dsk$scommx[p]==1) mat<-rbind(mat, mx<-c(dsk$result[p], dsk$max_home_odd[p], dsk$max_away_odd[p], dsk$max_draw_odd[p], 0, 0, 1, dsk$esito[p], "X"))
}
colnames(mat)<-c("score", "max_odds_home_win", "max_odds_away_win", "max_odds_draw", "scomm1", "scomm2", "scommx", "esito", "punt")
mat1<-matrix(NA,nrow(mat),3)
mat1[,1]<-as.numeric(mat[,2])
mat1[,2]<-as.numeric(mat[,3])
mat1[,3]<-as.numeric(mat[,4])
mat<-as.data.frame(mat[,-c(2,3,4)])
mat$max_odds_home_win<-mat1[,1]
mat$max_odds_away_win<-mat1[,2]
mat$max_odds_draw<-mat1[,3]
mat$gain<-NA
for (k in 1:nrow(mat)){
  mat$gain[k]<-ifelse(mat$esito[k]!=mat$punt[k], -50, ifelse(mat$punt[k]=="1", 50*mat$max_odds_home_win[k]-50, ifelse(mat$punt[k]=="2", 50*mat$max_odds_away_win[k]-50, 50*mat$max_odds_draw[k]-50)))
}
gain_stategy<-cumsum(mat$gain)[k]
gain_4_match<-gain_stategy/NROW(cumsum(mat$gain))
d<-c(gain_stategy,gain_4_match,c[h,1],c[h,2],c[h,3])
s<-rbind(s,d)
print(h)
}
colnames(s)<-c("guadagno","g_per_schedina","w1","w2","w3")
#write.table(s,"poisson_gain.txt")
which.max(s[,"g_per_schedina"])
s[210,] #w1=0.03, w2=0.15, w3=0.82