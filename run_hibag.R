#Set arguments
args <- commandArgs(trailingOnly = TRUE)
pre.trained.rdata.file.name <- args[1]
bed.fn <- args[2]
bim.fn <- args[3]
fam.fn <- args[4]
allele.config.file <- args[5]
out.fn.prefix <- args[6]

#Load library
library(HIBAG)

#Load pre-trained models 
model.list <- get(load(pre.trained.rdata.file.name))

#Load genotype data to impute
geno <- hlaBED2Geno(bed.fn=bed.fn, fam.fn=fam.fn, bim.fn=bim.fn)
summary(geno)

#Read list of HLA alleles to impute
alleles <- read.table(allele.config.file, stringsAsFactors = F)[,1]

for (allele in alleles) {
  #Set output file names
  out.fn.value <- paste0(out.fn.prefix, "_HLA_", allele, "_value.txt")
  out.fn.postprob <- paste0(out.fn.prefix, "_HLA_", allele, "_postprob.txt")
  
  #Run HLA imputation
  model <- hlaModelFromObj(model.list[[allele]])
  summary(model)
  
  #Best-guess genotypes and all posterior probabilities
  pred.guess <- predict(model, geno, type="response+prob")
  summary(pred.guess)

  #Write the output
  write.table(pred.guess$value, out.fn.value,  sep="\t", quote=F, row.names=F, col.names=T)
  write.table(pred.guess$postprob, out.fn.postprob,  sep="\t", quote=F, row.names=F, col.names=T)
}

