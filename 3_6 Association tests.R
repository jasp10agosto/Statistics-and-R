#getting the data
d = read.csv("assoctest.csv")
glimpse(d)
head(d)
#chi-square test
tab <- table(d$allele, d$case)
tab
chisq.test(tab)
chisq.test(tab)$p.value
#fisher-test
fisher.test(tab)

#End!