# 1
dat_len = 9
x = c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y = c(100, 95, 70, 90, 90, 90, 89, 90, 100)

Data_Frame = data.frame(x, y)

dat = y - x

# a
sd_dat = sd(dat)

# b
sample_dat_len = dat_len/2
sample_dat = sample(sd_dat, sample_dat_len)

xbar = mean(sample_dat)
mu = mean(dat)

t = (xbar - mu) / (sd(sample_dat)/sqrt(sample_dat_len))
p_val = 2 * pt(-abs(t), df = sample_dat_len - 1 )

# 2
mu = 20000
n = 100
xbar = 23500
s = 3900

t = (xbar - mu) / (s/sqrt(n))

p_val = 2* pt(-abs(t), df = n-1)

# 3
#install.packages("BSDA")
#install.packages("mosaic")
library(mosaic)
library(BSDA)

n_1 = 19
n_2 = 27
mean_1 = 3.64
mean_2 = 2.79
s_1 = 1.67
s_2 = 1.32
df = 2
conf = 0.95

# a
#H0 = Ada perbdeaan antara rata-rata Bandung dan Bali
#H1 = Tidak ada perbedaan antara rata-rata Bandung dan Bali

# b
tsum.test(mean.x = mean_1, s.x = s_1, n.x = n_1, 
          mean.y = mean_2, s.y = s_2, n.y = n_2,
          var.equal = TRUE)
# c 
plotDist(dist = 't', df = 2)

# d
qt(p = (1-conf)/2, df = 2, lower.tail = FALSE)

# e
# Dari data kita menerima H0

# f
# Dari nilai P-Value yaitu 0,06 kita dapat melihat bahwa p value besar dari 0,05 yang menyebabkan kita menerima hipotesis null

# 4
# a
dat = read.table("No_4.txt", h = T)
attach(dat)
names(dat)

# Set Group 1 2 3 as a factor
dat$Group = as.factor(dat$Group)
# Label the group
dat$Group = factor(dat$Group, labels = c("oren", "hitam", "putih"))

Group1 = subset(dat, Group == "oren")
Group2 = subset(dat, Group == "hitam")
Group3 = subset(dat, Group == "putih")

qqnorm(Group1$Length)
qqline(Group1$Length)

qqnorm(Group2$Length)
qqline(Group2$Length)

qqnorm(Group3$Length)
qqline(Group3$Length)

# b
# Homegeneneity of variances
bartlett.test(Length ~ Group, data = dat)

# Simpulan
# Karena p value > 0,05 maka variances p value group sama

# c
# Anova test with linear model
model1 = lm(Length ~ Group, data = dat)
anova(model1 )

# Simpulan
# Karena lebih kecil dari 0,05 maka kita reject H0

# Melihat mana length yg berbeda utk tiap group
TukeyHSD(aov(mdl))

# Simpulan
# Yang memiliki perbedaan panjang hanya kucing putih dan oren

# F
# Melihatkan data
# install.packages("ggplot2")
library("ggplot2")

ggplot(dat, aes(x = Group, y = Length))+ 
  geom_boxplot(fill = "grey80", colour = "black") + 
  scale_x_discrete() + 
  xlab("Group") + ylab("Length")

# 5
# install.packages("multcompView", dependencies = TRUE)
# install.packages("ggpubr", dependencies = TRUE)
library("multcompView")
library("ggplot2")
library("ggpubr")
library(dplyr)

dat = read.csv("GTL.csv")
attach(dat)
names(dat)

# Set Temp A B C as a factor
dat$Temp = as.factor(dat$Temp)
# Label the Temp
dat$Temp = factor(dat$Temp, labels = c("A", "B", "C"))

table(dat$Temp, dat$Temp)

# a
ggline(
  dat, x = "Temp", y = "Light", color = "Glass",
  add = c("dotplot"), palette = c("#00AFBB", "#E7B800", "#46eb34")
)

#b
anov = aov(Light ~ Glass + Temp + Glass:Temp, dat)
summary(anov)

#c
group_by(dat, Glass, Temp) %>% 
  summarise(mean=mean(Light), sd=sd(Light))

#d
tuky = TukeyHSD(anov)
tuky

# e
multcompLetters4(anov, tuky)