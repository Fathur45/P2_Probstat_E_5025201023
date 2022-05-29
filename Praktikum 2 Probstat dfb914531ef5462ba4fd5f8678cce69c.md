# Praktikum 2 Probstat

### Soal 1

**Full Code**

```r
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
```

Sebelum memasuki a dan b kita masukan dulu data kedalam suatu vector x dan y, dan juga mengassign panjang data tersebut

1. Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas
    
    ```r
    # a
    sd_dat = sd(dat)
    ```
    
    Mencari standar deviasi di r dapat kita cari dengan menggunakan function pada R yaitu sd(). Dari sana kita mendapat sd sebesar 6,36
    
2. carilah nilai t (p-value)
    
    Untuk mecari p value dengan t distribution kita pertama mengambil sampel acak sebesar setengah dari data
    
    ```r
    sample_dat_len = dat_len/2
    sample_dat = sample(sd_dat, sample_dat_len)
    ```
    
    Setelah itu kita mencari t distributionnya dengan rumus
    
    $$
    t=\frac{\overline{x}-\mu}{s/ \sqrt{n}}
    $$
    
    ```r
    xbar = mean(sample_dat)
    mu = mean(dat)
    
    t = (xbar - mu) / (sd(sample_dat)/sqrt(sample_dat_len))
    ```
    
    Dari sana kita bisa mendapat bervariasi jawaban, salah satunya adalah 0.68
    
    Untuk mecari p value kita bisa mencari melalui rumus p value
    
    ```r
    p_val = 2 * pt(-abs(t), df = sample_dat_len - 1 )
    ```
    
    Dengan hasil yaitu 0,53
    
3. tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”
    
    
    Kita ketahui jika P Value lebih besar dari $\alpha$ maka kita akan menerima H0 dan karena 0,53 > dari 0,05 maka “Tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴” itu benar
    

### Soal 2

**Full Code**

```r
# 2
mu = 20000
n = 100
xbar = 23500
s = 3900

t = (xbar - mu) / (s/sqrt(n))

p_val = 2* pt(-abs(t), df = n-
```

Dari soal diketahui

$H_o> 20.000$ 

$H_1\leq20.000$

$\mu =20.000$

$n=100$

$\bar{x}=23.500$

$s=3900$

```r
mu = 20000
n = 100
xbar = 23500
s = 3900
```

Dari sana kita bisa langsung menggunakan rumus t

$$
t=\frac{\overline{x}-\mu}{s/ \sqrt{n}}
$$

Dimana mendapat nilai t sebesar 8,97

```r
t = (xbar - mu) / (s/sqrt(n))
```

Lalu kita bisa menentukan nilai P Value dengan rumus

```r
p_val = 2* pt(-abs(t), df = n-1)
```

Dimana nilai P didapat 1,89

1. Apakah Anda setuju dengan klaim tersebut?
    
    Secara kasat mata saya setuju dikarenakan sampel yang di dapatkan sudah memenuhi hipotesisnya, namun untuk mencarinya secara statistik mari kita uji dengan P Value
    
2. Jelaskan maksud dari output yang dihasilkan!
    
    Dari percobaan kita mendapatkan bahwa t-distirbution adalah 8,97 dan p value-nya 1,89. Maka H0 akan diterima
    
3. Disini saya mengambil Confidence level 95% maka dari sana kita mendapat bahwa
    
    $$
    C = 0,95
    $$
    
    $$
    \alpha=1-C=0,05
    $$
    
    Maka dari sana kita mendapat bawha P Value lebih besar $\alpha$ maka kita accept $H_0$.
    
    Dengan kata lain “Mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun” itu benar.
    

### Soal 3

**Full Code**

```r
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
```

| Nama Kota/Atribut | Bandung | Bali |
| --- | --- | --- |
| Jumlah Saham | 19 | 27 |
| Sampel Mean | 3.64 | 2.79 |
| Sample Standar Deviasi | 1.67 | 1.32 |

$\alpha = 0.05$

Nilai Variance juga sama

1. H0 dan H1
    
    H0 = Ada perbdeaan antara rata-rata Bandung dan Bali
    
    H1 = Tidak ada perbedaan antara rata-rata Bandung dan Bali
    
2. Hitung Sampel Statistik
    
    Dengan menggunakan tsum.test dari library BSDA kita dapat melihat sampel statistik
    
    ```r
    tsum.test(mean.x = mean_1, s.x = s_1, n.x = n_1, 
              mean.y = mean_2, s.y = s_2, n.y = n_2,
              var.equal = TRUE)
    ```
    
    Hasilnya sebagai berikut
    
    ![Untitled](Praktikum%202%20Probstat%20dfb914531ef5462ba4fd5f8678cce69c/Untitled.png)
    
3. Lakukan Uji Statistik (df =2)
    
    Untuk mendapat plottingannya kita import package mosaic dan menggunakan plotDist
    
    ```r
    plotDist(dist = 't', df = 2)
    ```
    
    Hasilnya
    
    ![Untitled](Praktikum%202%20Probstat%20dfb914531ef5462ba4fd5f8678cce69c/Untitled%201.png)
    
4. Nilai Kritikal
    
    Dengan menggunakan qt kita langsung mendapat nilai critical
    
    ```r
    qt(p = (1-conf)/2, df = 2, lower.tail = FALSE)
    ```
    
    Hasilnya 4,302
    
5. Keputusan
    
    Dari data kita menerima H0
    
6. Kesimpulan
    
    Dari nilai P-Value yaitu 0,06 kita dapat melihat bahwa p value besar dari 0,05 yang menyebabkan kita menerima hipotesis null
    

### Soal 4

**Full Code**

```r
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
```

H0 = Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya
sama

H1 = Ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya
sama

1. Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.
    
    Pertama kita memasukan data txt dalam variabel
    
    ```r
    dat = read.table("No_4.txt", h = T)
    attach(dat)
    names(dat)
    ```
    
    Lalu kita membagi data tersebut menjadi tiap group. Kita melakukan itu menggunakan factor.
    
    ```r
    # Set Group 1 2 3 as a factor
    dat$Group = as.factor(dat$Group)
    # Label the group
    dat$Group = factor(dat$Group, labels = c("oren", "hitam", "putih"))
    ```
    
    Disini kita juga melabel tiap group pada data
    
    Lalu kita set subset dari data menjadi variabel sendirinya
    
    ```r
    Group1 = subset(dat, Group == "oren")
    Group2 = subset(dat, Group == "hitam")
    Group3 = subset(dat, Group == "putih")
    ```
    
    Setelah itu kita melihat plot kuantil normal untuk tiap group
    
    ```r
    qqnorm(Group1$Length)
    qqline(Group1$Length)
    
    qqnorm(Group2$Length)
    qqline(Group2$Length)
    
    qqnorm(Group3$Length)
    qqline(Group3$Length)
    ```
    
    Hasilnya sebagai berikut
    
    **QQ 1**
    
    ![Untitled](Praktikum%202%20Probstat%20dfb914531ef5462ba4fd5f8678cce69c/Untitled%202.png)
    
    Dari plotnya kita melihat tidak ada outlier dalam plot
    
    **QQ 2**
    
    ![Untitled](Praktikum%202%20Probstat%20dfb914531ef5462ba4fd5f8678cce69c/Untitled%203.png)
    
    Dari plotnya kita melihat tidak ada outlier dalam plot
    
    **QQ 3**
    
    ![Untitled](Praktikum%202%20Probstat%20dfb914531ef5462ba4fd5f8678cce69c/Untitled%204.png)
    
    Dari plotnya kita melihat tidak ada outlier dalam plot
    
2. carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?
    
    Untuk melihat Homogeneity of variances kita menggunakan fungsi bartlett
    
    ```r
    # Homegeneneity of variances
    bartlett.test(Length ~ Group, data = dat)
    ```
    
    Hasilnya sebagai berikut :
    
    ![Untitled](Praktikum%202%20Probstat%20dfb914531ef5462ba4fd5f8678cce69c/Untitled%205.png)
    
    Kita mendapatkan nilai P = 0.8054
    
    **Simpulan**
    
    Dan karena p value > 0,05 maka variances p value group sama
    
3. Untuk uji ANOVA (satu arah), buatlah model linier dengan Panjang versus
Grup dan beri nama model tersebut model 1.
    
    Kita membuat linear model terdahulu lalu melakukan ANOVA Test
    
    ```r
    # Anova test with linear model
    model1 = lm(Length ~ Group, data = dat)
    anova(model1 )
    ```
    
4. Dari Hasil Poin C, Berapakah nilai-p ? , Apa yang dapat Anda simpulkan
dari H0?
    
    Hasilnya sebagai berikut
    
    ![Untitled](Praktikum%202%20Probstat%20dfb914531ef5462ba4fd5f8678cce69c/Untitled%206.png)
    
    Nilai P = 0,0013.
    
    **Simpulan**
    
    Karena lebih kecil dari 0,05 maka kita reject H0
    
5. Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.
    
    Kita lakukan test Tukey HSD
    
    ```r
    # Melihat mana length yg berbeda utk tiap group
    TukeyHSD(aov(mdl))
    ```
    
    Hasilnya sebagai berikut
    
    ![Untitled](Praktikum%202%20Probstat%20dfb914531ef5462ba4fd5f8678cce69c/Untitled%207.png)
    
    **Simpulan**
    
    Dari ketiga nilai P kita ketahui bahwa jika P Value > 0,05 maka kita reject H0. Maka
    
    - Hitam - Oren : Tidak mempunyai perbedaan panjang
    - Putih - Oren : Punya perbedaan panjang
    - Putih - Hitam : Tidak mempunyai perbedaan panjang
    
6. Visualisasikan data dengan ggplot2
    
    Pertama kita donwload library ggplot2
    
    ```r
    install.packages("ggplot2")
    library("ggplot2")
    ```
    
    Kita tampilkan dalam bentuk Boxplot
    
    ```r
    ggplot(dat, aes(x = Group, y = Length))+ 
    geom_boxplot(fill = "grey80", colour = "black") + 
    scale_x_discrete() + 
    xlab("Group") + ylab("Length")
    ```
    
    Berbentuk sebagai berikut :
    
    ![Untitled](Praktikum%202%20Probstat%20dfb914531ef5462ba4fd5f8678cce69c/Untitled%208.png)
    

### Soal 5

**Full Code**

```r
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
```

1. Buatlah plot sederhana untuk visualisasi data
    
    ```r
    ggline(
      dat, x = "Temp", y = "Light", color = "Glass",
      add = c("dotplot"), palette = c("#00AFBB", "#E7B800", "#46eb34")
    )
    ```
    
    Disini kita menggunakan library ggpubr dengan function ggline yang mengghasilkan sebagai berikut
    
    ![Untitled](Praktikum%202%20Probstat%20dfb914531ef5462ba4fd5f8678cce69c/Untitled%209.png)
    
2. Lakukan uji ANOVA dua arah
    
    Sama dengan no 4 namun disini kita menambahkan satu kolom lagi dengan +
    
    ```r
    anov = aov(Light ~ Glass + Temp + Glass:Temp, dat)
    summary(anov)
    ```
    
    Hasilnya sebagai berikut
    
    ![Untitled](Praktikum%202%20Probstat%20dfb914531ef5462ba4fd5f8678cce69c/Untitled%2010.png)
    
3. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)
    
    Menggunakan group by kita bisa melihat mean dan sd berdasarkan grup kedua yaitu suhu
    
    ```r
    group_by(dat, Glass, Temp) %>% 
      summarise(mean=mean(Light), sd=sd(Light))
    ```
    
    Hasilnya sebagai berikut
    
    ![Untitled](Praktikum%202%20Probstat%20dfb914531ef5462ba4fd5f8678cce69c/Untitled%2011.png)
    
4. Lakukan uji Tukey
    
    Sama dengan no 4 kita langsung memanggil fungsi TukeyHSD
    
    ```r
    tuky = TukeyHSD(anov)
    tuky
    ```
    
    Hasilnya sebagai berikut
    
    ![Untitled](Praktikum%202%20Probstat%20dfb914531ef5462ba4fd5f8678cce69c/Untitled%2012.png)
    
5. Gunakan compact letter display untuk menunjukkan perbedaan signifikan
antara uji Anova dan uji Tukey
    
    Terakhir kita menggunakan comapct letter dengan library mulcompview untuk melihat perbedaan berdasarkan compact letter
    
    ```r
    multcompLetters4(anov, tuky)
    ```
    
    Hasilnya sebagai berikut
    
    ![Untitled](Praktikum%202%20Probstat%20dfb914531ef5462ba4fd5f8678cce69c/Untitled%2013.png)