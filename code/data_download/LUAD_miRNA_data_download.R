library("TCGAbiolinks")
library("SummarizedExperiment")

#downloading tumor data
query_TCGA_LUAD_miRNA <- GDCquery(project = 'TCGA-LUAD',
                           data.category = 'Transcriptome Profiling',
                           sample.type = c('Primary Tumor','Solid Tissue Normal'),
                           data.type = 'miRNA Expression Quantification',
                           experimental.strategy = 'miRNA-Seq')

GDCdownload(query_TCGA_LUAD_miRNA)

TCGA_LUAD_miRNA_data <- GDCprepare(query_TCGA_LUAD_miRNA, summarizedExperiment = TRUE)

#LUAD_miRNA_matrix <- assay(TCGA_LUAD_miRNA_data, 'unstranded')

# Verinin ilk birkaç satırını kontrol et
head(TCGA_LUAD_miRNA_data)

# 'miRNA_ID' sütununu ve 'read_count' içeren sütunları seçmek
read_count_data <- TCGA_LUAD_miRNA_data[, c(1, grep("read_count", colnames(TCGA_LUAD_miRNA_data)))]

# Verinin ilk birkaç satırını inceleyelim
head(read_count_data)


# Export the matrix to a text file
write.table(read_count_data, file = "TCGA_LUAD_miRNA_expression.txt", sep = "\t", row.names = TRUE, col.names = TRUE)

