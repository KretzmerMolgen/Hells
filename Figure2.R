require(ggplot2)
require(data.table)
require(vioplot)
require(plyr)
require(gridExtra)
require(ggExtra)
require(ComplexHeatmap)

# Figure 2B
data <- data.frame(fread("Fig2BD_source_data.tsv", header = TRUE, sep = "\t"), stringsAsFactors = FALSE, check.names = FALSE)

pdf('Fig2B_scatter.pdf')
smoothScatter(data$Delta_WT_DE_atac, data$Delta_HELLS_DE_atac, xlim= c(-10,10), ylim= c(-10,10))
smoothScatter(data$Delta_WT_DE_methyl, data$Delta_HELLS_DE_methyl, xlim=c(-0.75,0.75), ylim=c(-0.75,0.75))
dev.off()dev.off()


# Figure 2D
data <- data.frame(fread("Fig2BD_source_data.tsv", header = TRUE, sep = "\t"), stringsAsFactors = FALSE, check.names = FALSE)

pdf('Fig2C_scatter.pdf')
smoothScatter(data$Delta_WT_DE_methyl, data$Delta_WT_DE_atac, xlim=c(-0.75,0.75) , ylim= c(-10,10))
smoothScatter(data$Delta_HELLS_DE_methyl, data$Delta_HELLS_DE_atac, xlim=c(-0.75,0.75) , ylim= c(-10,10))
dev.off()dev.off()


# Figure 2E
data <- data.frame(fread("Fig2E_source_data.tsv", header = TRUE, sep = "\t"), stringsAsFactors = FALSE, check.names = FALSE)

dataForPca <- data[,-1]
pca <- prcomp(t(dataForPca))
PCA <- data.frame(pca$x, label=sub('_rep.*','',colnames(dataForPca)))
percentage <- summary(pca)$importance['Proportion of Variance',]
percentage <- paste(colnames(PCA), ' (', as.character(round(percentage * 100, 2)), '%', ')', sep='')
PCA$label <- factor(PCA$label, levels=c('WT','Hells_KO_B3','WT_DE','Hells_KO_DE_B3'))

pdf('Fig2E_PCA.pdf')
ggplot(PCA, aes(x=PC1, y=PC2, color=label)) + geom_point(size=2) + xlab(percentage[1]) + ylab(percentage[2]) + theme_classic()
dev.off()dev.off()


# Figure 2F
data <- data.frame(fread("Fig2F_source_data.tsv", header = TRUE, sep = "\t"), stringsAsFactors = FALSE, check.names = FALSE)

pdf('Fig2F_PCA.pdf')
Heatmap(data, show_row_names=F)
dev.off()










