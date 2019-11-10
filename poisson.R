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
which(mediaAfatti==0)
which(mediaAsubiti==0)
which(mediaHsubiti==0)
which(mediaHfatti==0)
#moltiplico gol fatti squadra in casa x gol subiti squadra fuori x media gol in casa campionato
#moltiplico gol fatti squadra fuori x gol subiti squadra in casa x media gol fuori campionato
#ottengo 2 medie che andrò a confrontare con distribuzione poisson
dati_poi$fattiH<-dati_poi$subitiH<-dati_poi$fattiA<-dati_poi$subitiA<-dati_poi$fattiHtot<-dati_poi$fattiAtot<-dati_poi$lamh<-dati_poi$lama<-NA
contatore<-which(mediaAfatti!=0 & mediaAsubiti!=0 & mediaHsubiti!=0 & mediaHfatti!=0)
for (i in contatore){
  dati_poi$fattiAtot[i]<-mediaAtot[i]
  dati_poi$fattiHtot[i]<-mediaHtot[i]
  dati_poi$subitiA[i]<-mediaAsubiti[i]
  dati_poi$fattiA[i]<-mediaAfatti[i]
  dati_poi$subitiH[i]<-mediaHsubiti[i]
  dati_poi$fattiH[i]<-mediaHfatti[i]
  dati_poi$lamh[i]<-sum(dati_poi$fattiHtot[i],dati_poi$fattiH[i],dati_poi$subitiA[i])/3
  dati_poi$lama[i]<-sum(dati_poi$fattiAtot[i],dati_poi$fattiA[i],dati_poi$subitiH[i])/3
}

dati_poi$X1_prob_poi<-dati_poi$X2_prob_poi<-dati_poi$X_prob_poi<-NA
gol1<-gol2<-p_vinc1<-p_vinc2<-c()
for (j in contatore){
  for (k in 0:7){
    gol1[k+1]<-dpois(k,dati_poi$lamh[j])
    gol2[k+1]<-dpois(k,dati_poi$lama[j])
    p_vinc1[k+1]<-(1-ppois(k,dati_poi$lamh[j]))
    p_vinc2[k+1]<-(1-ppois(k,dati_poi$lama[j]))
  }
  dati_poi$X_prob_poi[j]<-sum(gol1*gol2)
  dati_poi$X1_prob_poi[j]<-sum(p_vinc1*gol2)
  dati_poi$X2_prob_poi[j]<-sum(p_vinc2*gol1)
}
# write.csv(dati_poi,"prob_pois.csv")

#metto tutti i possibili pesi
a<-seq(0.01,0.98,by=0.01)
c<-c()
for (i in a) {
  for (j in a) {
    for (k in a) {
      if(i+j+k==1) {b<-c(i,j,k);c<-rbind(c,b)}
    }
  }
}
d<-c()
dati_poi$sc<-NA
for (h in 1:2){
for (i in contatore){
  dati_poi$fattiAtot[i]<-mediaAtot[i]
  dati_poi$fattiHtot[i]<-mediaHtot[i]
  dati_poi$subitiA[i]<-mediaAsubiti[i]
  dati_poi$fattiA[i]<-mediaAfatti[i]
  dati_poi$subitiH[i]<-mediaHsubiti[i]
  dati_poi$fattiH[i]<-mediaHfatti[i]
  dati_poi$lamh[i]<-sum(dati_poi$fattiHtot[i]*c[h,1],dati_poi$fattiH[i]*c[h,2],dati_poi$subitiA[i]*c[h,3])
  dati_poi$lama[i]<-sum(dati_poi$fattiAtot[i]*c[h,1],dati_poi$fattiA[i]*c[h,2],dati_poi$subitiH[i]*c[h,3])
}
dati_poi$X1_prob_poi<-dati_poi$X2_prob_poi<-dati_poi$X_prob_poi<-NA
gol1<-gol2<-p_vinc1<-p_vinc2<-c()
for (j in contatore){
  for (k in 0:7){
    gol1[k+1]<-dpois(k,dati_poi$lamh[j])
    gol2[k+1]<-dpois(k,dati_poi$lama[j])
    p_vinc1[k+1]<-(1-ppois(k,dati_poi$lamh[j]))
    p_vinc2[k+1]<-(1-ppois(k,dati_poi$lama[j]))
  }
  dati_poi$X_prob_poi[j]<-sum(gol1*gol2)
  dati_poi$X1_prob_poi[j]<-sum(p_vinc1*gol2)
  dati_poi$X2_prob_poi[j]<-sum(p_vinc2*gol1)
  dati_poi$sc[j]<-ifelse(dati_poi$X1_prob_poi[j]>dati_poi$X2_prob_poi[j],ifelse(dati_poi$X1_prob_poi[j]>dati_poi$X_prob_poi[j],"1","X"),ifelse(dati_poi$X2_prob_poi[j]>dati_poi$X_prob_poi[j],"2","X"))
}
  acc<-mean(dati_poi$sc[contatore]==dati_poi$Esito[contatore])
  e<-mean(dati_poi$X1_prob_poi)
  f<-mean(dati_poi$X_prob_poi)
  g<-mean(dati_poi$X2_prob_poi)
  l<-c(e,f,g,acc,c[h,1],c[h,2],c[h,3])
  d<-rbind(d,l)
  print(h)
}

dati<-read.table("accuracyepesi.txt",header = T)
prop.table(table(dati_poi$Esito))
colnames(dati)<-c("1","X","2","accuracy","w1","wx","w2")
dati[which(dati$accuracy>0.5 & dati$`1`>0.41),]

#prova gain
d<-c()
dati_poi$sc<-NA
for (h in 1:2){
  for (i in contatore){
    dati_poi$fattiAtot[i]<-mediaAtot[i]
    dati_poi$fattiHtot[i]<-mediaHtot[i]
    dati_poi$subitiA[i]<-mediaAsubiti[i]
    dati_poi$fattiA[i]<-mediaAfatti[i]
    dati_poi$subitiH[i]<-mediaHsubiti[i]
    dati_poi$fattiH[i]<-mediaHfatti[i]
    dati_poi$lamh[i]<-sum(dati_poi$fattiHtot[i]*c[h,1],dati_poi$fattiH[i]*c[h,2],dati_poi$subitiA[i]*c[h,3])
    dati_poi$lama[i]<-sum(dati_poi$fattiAtot[i]*c[h,1],dati_poi$fattiA[i]*c[h,2],dati_poi$subitiH[i]*c[h,3])
  }
  dati_poi$X1_prob_poi<-dati_poi$X2_prob_poi<-dati_poi$X_prob_poi<-NA
  gol1<-gol2<-p_vinc1<-p_vinc2<-c()
  for (j in contatore){
    for (k in 0:7){
      gol1[k+1]<-dpois(k,dati_poi$lamh[j])
      gol2[k+1]<-dpois(k,dati_poi$lama[j])
      p_vinc1[k+1]<-(1-ppois(k,dati_poi$lamh[j]))
      p_vinc2[k+1]<-(1-ppois(k,dati_poi$lama[j]))
    }
    dati_poi$X_prob_poi[j]<-sum(gol1*gol2)
    dati_poi$X1_prob_poi[j]<-sum(p_vinc1*gol2)
    dati_poi$X2_prob_poi[j]<-sum(p_vinc2*gol1)
    dati_poi$sc[j]<-ifelse(dati_poi$X1_prob_poi[j]>dati_poi$X2_prob_poi[j],ifelse(dati_poi$X1_prob_poi[j]>dati_poi$X_prob_poi[j],"1","X"),ifelse(dati_poi$X2_prob_poi[j]>dati_poi$X_prob_poi[j],"2","X"))
  }
  acc<-mean(dati_poi$sc[contatore]==dati_poi$Esito[contatore])
  e<-mean(dati_poi$X1_prob_poi)
  f<-mean(dati_poi$X_prob_poi)
  g<-mean(dati_poi$X2_prob_poi)
  l<-c(e,f,g,acc,c[h,1],c[h,2],c[h,3])
  d<-rbind(d,l)
  print(h)
}