require(ggplot2)
require(data.table)
require(vioplot)
require(plyr)
require(gridExtra)
require(ggExtra)
require(ComplexHeatmap)

# Figure 1B
data <- data.frame(fread("Fig1B_source_data.tsv", header = TRUE, sep = "\t"), stringsAsFactors = FALSE, check.names = FALSE)

pdf('Fig1B_vioplot.pdf', width=21)
vioplot(data[,-c(1:4)], plotCentre = "line")
dev.off()


# Figure 1C
data <- data.frame(fread("Fig1C_source_data.tsv", header = TRUE, sep = "\t"), stringsAsFactors = FALSE, check.names = FALSE)

pdf('Fig1C_boxplots.pdf', width=21)
ggplot(data, aes(x=segment, fill=variable, y=value)) + geom_boxplot(outlier.shape=NA) + theme_classic()
dev.off()


# Figure 1E
data <- data.frame(fread("Fig1E_source_data.tsv", header = TRUE, sep = "\t"), stringsAsFactors = FALSE, check.names = FALSE)

pdf('Fig1E_heatmap.pdf', height=14)
Heatmap(censat[,c('HiPSC_WT_T2T','HiPSC_Hells_KO_T2T','HiPSC_3B_KO_T2T','HiPSC_3A_3B_DKO_T2T')], show_row_names=F, split=censat$segment)
dev.off()


# Figure 1G
data <- data.frame(fread("Fig1G_source_data.tsv", header = TRUE, sep = "\t"), stringsAsFactors = FALSE, check.names = FALSE)

pdf('Fig1G_splitvioplot.pdf')
vioplot(tiles[,c('HiPSC_WT_G2_T2T','HiPSC_Hells_KO_G2_T2T')], side = "left", plotCentre = "line")
vioplot(tiles[,c('HiPSC_WT_T2T','HiPSC_Hells_KO_T2T')], side = "right", add = T, plotCentre = "line")
dev.off()
