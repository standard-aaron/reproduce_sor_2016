record = c()
for(i in 1:100){
n = 680
x = matrix(rpois(3 * n, 850), 3, n)
sampleMean = apply(x, 2, mean)
sampleVar  = apply(x, 2, var)
plot(jitter(sampleMean,1), jitter(sampleVar,1),
     xlim = c(0, 1000), ylim = c(0, 5000))
ind = (sampleMean > 600 & sampleMean < 800)
 sum(ind, na.rm = T)
record[i] = mean(sampleVar[ind], na.rm = T)
}
hist(record)

# read data from xls
require('gdata')
rawData <- read.xls('./data/Other Investigators in Lab.Coulter Counts.4.15.92-5.21.05.xlsx', 
               sheet = 'Sheet1')
cleanData <- rawData[-c(1,2), 3:5]
for(i in 1:3){
  cleanData[[i]] = as.numeric(as.character(cleanData[[i]]))
}
y = cleanData
summary(y)
sampleMean = apply(y, 1, mean)
sampleVar  = apply(y, 1, var)
plot(jitter(sampleMean,1), jitter(sampleVar,1),
     xlim = c(0, 1000), ylim = c(0, 5000))

ind = (sampleMean > 600 & sampleMean < 800)
sum(ind, na.rm = T)
mean(sampleVar[ind], na.rm = T)

