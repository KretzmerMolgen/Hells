require(ggplot2)
require(data.table)
require(vioplot)
require(plyr)
require(gridExtra)
require(ggExtra)
require(ComplexHeatmap)

# Figure S2A
data <- data.frame(fread("FigS1EFH_source_data.tsv", header = TRUE, sep = "\t"), stringsAsFactors = FALSE, check.names = FALSE)

pdf('FigS2A_smoothscatter.pdf')
smoothScatter(data$WT, data$KO1)
abline(-0.1,1)
abline(0.1,1)
smoothScatter(data$WT, data$B)
abline(-0.1,1)
abline(0.1,1)
smoothScatter(data$WT, data$AB)
abline(-0.1,1)
abline(0.1,1)
dev.off()


# Figure S2B
data <- data.frame(fread("FigS2B_source_data.tsv", header = TRUE, sep = "\t"), stringsAsFactors = FALSE, check.names = FALSE)

pdf('FigS2B_boxplots.pdf', width=21)
ggplot(data, aes(x=segment, fill=variable, y=value)) + geom_boxplot(outlier.shape=NA) + theme_classic()
dev.off()


# Figure S2C
data <- data.frame(fread("FigS2C_source_data.tsv", header = TRUE, sep = "\t"), stringsAsFactors = FALSE, check.names = FALSE)

pdf('FigS2C_boxplots.pdf', width=21)
ggplot(data, aes(x=segment, fill=variable, y=log2(value+1))) + geom_boxplot(outlier.shape=NA) + theme_classic()
dev.off()

# Figure S2D
data <- data.frame(fread("FigS2D_source_data.tsv", header = TRUE, sep = "\t"), stringsAsFactors = FALSE, check.names = FALSE)

pdf('FigS2D_barplots.pdf', width=21)
ggplot(ddply(data, .(element), transform, frac=100*count/sum(count)), aes(x=element, y=frac, fill=delta)) + geom_bar(stat='identity') + theme_classic()
dev.off()


# Figure S2E
data <- data.frame(fread("FigS2E_source_data.tsv", header = TRUE, sep = "\t"), stringsAsFactors = FALSE, check.names = FALSE)

pdf('FigS2E_boxplots.pdf', width=14)
Heatmap(data, show_row_names=F, split=data$segment)
dev.off()


# Figure S2F
data <- data.frame(fread("FigS2F_source_data.tsv", header = TRUE, sep = "\t"), stringsAsFactors = FALSE, check.names = FALSE)

pdf('FigS2F_boxplots.pdf', width=21)
ggplot(data, aes(x=segment, fill=variable, y=log2(value+1))) + geom_boxplot(outlier.shape=NA) + theme_classic()
dev.off()

# Figure S2G
readRDS("FigS2G_source_data.RData")

pdf('FigS2G_violin.pdf', width=14)
vioplot(data_lists[['WT']], side = "left", plotCentre = "line", names=levels(factor(data$segment)))
vioplot(data_lists[['KO']], side = "right", add = T, plotCentre = "line", names=levels(factor(data$segment)))
dev.off()


