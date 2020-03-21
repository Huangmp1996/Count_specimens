setwd("D:\\R_project\\Count_mammal_specimens") # 设置工作目录
mam_list <- read.csv("mam_list.csv",stringsAsFactors = F)
mammal <- read.csv("mammal.csv",fileEncoding = "utf-8",stringsAsFactors = F)

### 先对名录进行数据清洗
# 删除mam_list末尾的空行
mam_list<-mam_list[-seq(660,684,by = 1),]
# 删除名录里Species字段末尾多余的空格并另存为Species_new字段
Species_new <- c()
for (n in mam_list$Species) {
  newname <- paste(strsplit(n,split = ' ')[[1]][1],strsplit(n,split = ' ')[[1]][2],sep = ' ')
  Species_new<<- c(Species_new,newname)
}
mam_list$Species_new <- Species_new
# 更正名录里Alexandromys的中文属名
mam_list$属[which(mam_list$属 == 'Alexandromys属')] <- '东方田鼠属'
# 更正名录里Species字段的'Allocricetulus eversmanni'拼写错误
mam_list$Species_new[which(mam_list$Species_new == 'Allocricetulus eversmanni')] <- 'Allocricetulus eversmanii'

### 对兽类表进行数据清洗
for (i in unique(mammal$属名)) {
  if (i %in% unique(mam_list$Genus))
    next
  else
    print(i)  # 找出兽类表中不在名录里的属，即i。
  # 这段代码：然后用兽类表该属i下的某个中文种名匹配名录里的种名，如能匹配上，就说明兽类表里该属的名字拼写错误
  # 可以用名录里正确的属名替代。会混淆整个属都变更还是属下某个种移到其他属。
  # 此段代码舍弃
    # chname<- mammal$中名[which(mammal$属名 == i)[1]]
    # if (chname %in% unique(mam_list$种)){
    #   print(paste(chname,'在名录里找到'))
    #   mammal$属名[which(mammal$属名 == i)] <- mam_list$Genus[which(mam_list$种 == chname)[1]]
    # }
    # else{
    #   print(paste(chname,'在名录里找不到'))
    # }
}
# 属名拼写错误
mammal$属名[which(mammal$属名 == 'Alicola')] <- 'Alticola'
mammal$属名[which(mammal$属名 == 'Capricornic')] <- 'Capricornis'
mammal$属名[which(mammal$属名 == 'Hylobaters')] <- 'Hylobates'
mammal$属名[which(mammal$属名 == 'Viverrcula')] <- 'Viverricula'
mammal$属名[which(mammal$属名 == 'Chimmarogale')] <- 'Chimarrogale'
mammal$属名[which(mammal$属名 == 'Mamota')] <- 'Marmota'
mammal$属名[which(mammal$属名 == 'Mcrotus')] <- 'Microtus'
mammal$属名[which(mammal$属名 == 'Rhixomys')] <- 'Rhizomys'
mammal$属名[which(mammal$属名 == 'Aselliscuss')] <- 'Aselliscus'
mammal$属名[which(mammal$属名 == 'Zozapus')] <- 'Eozapus'
mammal$属名[which(mammal$属名 == 'Zapus')] <- 'Eozapus'
mammal$属名[which(mammal$属名 == 'Hydiopotes')] <- 'Hydropotes'
mammal$属名[which(mammal$属名 == 'Sarex')] <- 'Sorex'
mammal$属名[which(mammal$属名 == 'Ochatona')] <- 'Ochotona'
mammal$属名[which(mammal$属名 == 'Lasiopodonmys')] <- 'Lasiopodomys'
# 种加词拼写错误
mammal$种名[which(mammal$种名 == 'brachotis')] <- 'brachyotis'
mammal$种名[which(mammal$种名 == 'nilssoni')] <- 'nilssonii'
mammal$种名[which(mammal$种名 == 'heathi')] <- 'heathii'
mammal$种名[which(mammal$种名 == 'davidi')] <- 'davidii'
mammal$种名[which(mammal$种名 == 'pequiniys')] <- 'pequinius'
mammal$种名[which(mammal$种名 == 'eversmanni')] <- 'eversmanii'
mammal$种名[which(mammal$种名 == 'eversmannii')] <- 'eversmanii'
mammal$种名[which(mammal$种名 == 'fuscuss')] <- 'fuscus'
mammal$种名[which(mammal$种名 == 'syilla')] <- 'sybilla'
mammal$种名[which(mammal$种名 == 'macclellandi')] <- 'mcclellandii'
mammal$种名[which(mammal$种名 == 'alaschanicus')] <- 'alashanicus'
mammal$种名[which(mammal$种名 == 'clarckei')] <- 'clarkei'
mammal$种名[which(mammal$种名 == 'coxingi')] <- 'coninga'
mammal$种名[which(mammal$种名 == 'andanmanensis')] <- 'andamanensis'
mammal$种名[which(mammal$种名 == 'temmincki')] <- 'temminckii'
mammal$种名[which(mammal$种名 == 'andanmanensis')] <- 'andamanensis'
# 属名变更，直接替换属名会混淆是整个属都变更还是属下某个种移到其他属，此段代码舍弃
# mammal$属名[which(mammal$属名 == 'Pitymys')] <- 'Neodon'
# mammal$属名[which(mammal$属名 == 'Clethrionomys')] <- 'Myodes'
# mammal$属名[which(mammal$属名 == 'Clethionomys')] <- 'Myodes'
# mammal$属名[which(mammal$属名 == 'Lutreola')] <- 'Mustela'
# mammal$属名[which(mammal$属名 == 'Blarinella')] <- 'Pantherina'
# mammal$属名[which(mammal$属名 == 'Soriculus')] <- 'Episoriculus'
# mammal$属名[which(mammal$属名 == 'Pipistrellus')] <- 'Hypsugo'
# mammal$属名[which(mammal$属名 == 'Pipistrellus')] <- 'Falsistrellus'
# mammal$属名[which(mammal$属名 == 'Felis')] <- 'Pardofelis'
# mammal$属名[which(mammal$属名 == 'Cervus')] <- 'Przewalskium'
# mammal$属名[which(mammal$属名 == 'Lagurus')] <- 'Eolagurus'
# mammal$属名[which(mammal$属名 == 'Myospalax')] <- 'Eospalax'
# mammal$属名[which(mammal$属名 == 'Myospalax')] <- 'Eospalax'

# 抽取出兽类表‘种名’字段的种加词，统一格式
new_epi <- c()
count = 1
for (j in mammal$种名) {#j = mammal$种名[21244]
  epithet <- strsplit(j,split = " ")[[1]][2]
  if(is.na(epithet))
    new_epi[count] <- strsplit(j,split = " ")[[1]][1]
  else{
    new_epi[count] <- epithet
  }
  count = count+1
}
mammal$new_epi <- new_epi
# 合并属名和种加词成拉丁学名‘spname’字段
mammal$spname<- paste(mammal$属名,mammal$new_epi,sep = ' ')
# 有一些分类变更只能手动在spname里改，比如长臂猿
mammal$spname[which(mammal$spname =='Hylobates concolor')] <- 'Nomascus concolor'
mammal$spname[which(mammal$spname =='Hylobates leucogenys')] <- 'Nomascus leucogenys'
mammal$spname[which(mammal$spname =='Hylobates hoolock')] <- 'Hoolock tianxing'


### 开始计数
# 思路：先直接在兽类表的spname字段里找有没有i，有就直接计数
# 如果没有找到，可能是属名变更了。为此，先用i的中文名去兽类表里找有没有该种，如果有，再匹配种加词确认是同一个种，用i替换
final <- data.frame()
for (i in mam_list$Species_new) {
  if (i %in% unique(mammal$spname)){ # 如果i在兽类表里，直接计数
    sptable<- mammal[mammal$spname == i,]
    library(plyr)
    result<- count(sptable$标本馆)
    result$name<- rep(i,length(result$x))
    final<<-rbind(result,final)
    }
  else{
    print(paste('名录里的',i,'在mammal里的spname字段中无法找到直接对应的'))# 名录里不能匹配的种
    chn <- mam_list$种[mam_list$Species_new == i] # 名录里i对应的中文种名
    if (chn %in% mammal$中名){ # i对应的中文种名能在兽类表里找到
      print(paste(i,chn,'对应'))
      if (strsplit(i,split = ' ')[[1]][2] == mammal$new_epi[which(mammal$中名 == chn)[1]]){#如果它们种加词相同
        #print(paste(i, '等于',mammal$spname[which(mammal$中名 == chn)]))
        print(paste(i, '已替换兽类表里的',mammal$spname[which(mammal$中名 == chn)]))
        mammal$spname[which(mammal$中名 == chn)] <- i# 用i修正兽类表里属名变更的种
        #再计数
        sptable<- mammal[mammal$spname == i,]
        library(plyr)
        result<- count(sptable$标本馆)
        result$name<- rep(i,length(result$x))
        final<<-rbind(result,final)
      }
      else
        print(paste(i, '不等于',mammal$spname[which(mammal$中名 == chn)]))
    }
  }
  }


### 以下是计算名录里每个属的每个标本馆标本数量
# 提取出名录里的中文属名和拉丁属名作为新的dataframe，便于后面合并
G <- subset(mam_list,select = c('属','Genus'))
index <- duplicated(G[,2])
G_dup <- G[!index,]# 去掉重复属名

mam_list<- subset(mam_list,select = c('种','Species_new','属','Genus'))
colnames(final) <- c('标本馆','数量','物种名')
final <- merge(final,mam_list,by.x = '物种名',by.y = 'Species_new')
# 分属计数
result<- ddply(final,.(Genus),function(x){
  ddply(x,.(标本馆),function(x) sum(x$数量))
})
result1<- merge(result,G_dup,by = 'Genus')
print(paste('共统计到',length(unique(result1$属)),'属'))

# 导出
# 提取出兽类表里正确的属名并创建新字段
num = i
for (k in mammal$spname) {
  mammal$correct_genus[num] <- strsplit(k,split = ' ')[[1]][1]
  num = num+1
}
# names(mammal)[names(mammal) == c('new_epi','spname','correct_genus')] <- c('正确的种名（种加词）','拉丁学名','正确的属名')
# write.csv(mammal,"兽类_corrected.csv",row.names = F)#导出清洗后的兽类表
# colnames(result1) <- c('Genus','标本馆','数量','中文属名')
# write.csv(result1,'count_specimens_per_genus.csv',row.names = F)
# write.csv(final,'count_specimens_per_species.csv',row.names = F)
