require(ggplot2)
require(data.table)
require(vioplot)
require(plyr)
require(gridExtra)
require(ggExtra)
require(ComplexHeatmap)

# Figure S3D
data <- data.frame(fread("FigS3D_source_data.tsv", header = TRUE, sep = "\t"), stringsAsFactors = FALSE, check.names = FALSE)

pdf('FigS3D_smoothscatter.pdf')
smoothScatter(data$WTG2, data$KOG2)
smoothScatter(data$WT, data$KOG2)
dev.off()


# Figure S3F
data <- data.frame(fread("FigS3F_source_data.tsv", header = TRUE, sep = "\t"), stringsAsFactors = FALSE, check.names = FALSE)

pdf('FigS3F_boxplots.pdf', width=21)
ggplot(data, aes(x=segment, fill=variable, y=value)) + geom_boxplot(outlier.shape=NA) + theme_classic()
dev.off()


# Figure S3G
readRDS("FigS3G_source_data.RData")

pdf('FigS3G_violin.pdf', width=14)
vioplot(data_lists[['WT']], side = "left", plotCentre = "line", names=levels(factor(data$segment)))
vioplot(data_lists[['KO']], side = "right", add = T, plotCentre = "line", names=levels(factor(data$segment)))
dev.off()
