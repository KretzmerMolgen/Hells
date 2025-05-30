require(ggplot2)
require(data.table)
require(vioplot)
require(plyr)
require(gridExtra)
require(ggExtra)
require(ComplexHeatmap)

data <- data.frame(fread("FigS1EFH_source_data.tsv", header = TRUE, sep = "\t"), stringsAsFactors = FALSE, check.names = FALSE)

# Figure S1E
pdf('FigS1E_smoothscatter.pdf')
smoothScatter(data$KO1, data$KO2)
abline(-0.1,1)
abline(0.1,1)
smoothScatter(data$KO1, data$KO3)
abline(-0.1,1)
abline(0.1,1)
smoothScatter(data$KO2, data$KO3)
abline(-0.1,1)
abline(0.1,1)
dev.off()


# Figure S1F
dataForPca <- data[,-c(1:3)]
dataForPca <- na.omit(dataForPca)
pca <- prcomp(t(dataForPca))
PCA <- data.frame(pca$x, label=colnames(dataForPca))
percentage <- summary(pca)$importance['Proportion of Variance',]
percentage <- paste(colnames(PCA), ' (', as.character(round(percentage * 100, 2)), '%', ')', sep='')

pdf('FigS1F_PCA.pdf')
ggplot(PCA, aes(x=PC1, y=PC2, color=label)) + geom_point(size=3) + xlab(percentage[1]) + ylab(percentage[2]) + theme_classic()
dev.off()


# Figure S1H
pdf('FigS1H_smoothscatter.pdf')
smoothScatter(data$WT, data$WTlong)
abline(-0.1,1)
abline(0.1,1)
smoothScatter(data$KO1, data$KO1long)
abline(-0.1,1)
abline(0.1,1)
smoothScatter(data$B, data$Blong)
abline(-0.1,1)
abline(0.1,1)
smoothScatter(data$AB, data$ABlong)
abline(-0.1,1)
abline(0.1,1)
dev.off()
