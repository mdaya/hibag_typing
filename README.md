A docker environment and calling script to run HIBAG on Seven Bridges on Biodata catalyst.

The docker build can be pulled from https://quay.io/repository/mdaya/hibag_typing

To run HLA-typing locally, use the following command from the docker instance:

```
bash /home/run_hibag.sh <pre_trained_rdata_file> <plink_bed_file> <allele_config_file>

```

## parameters

All parameters are mandatory and should be specified in order

### pre_trained_rdata_file

A RData file containing pre-trained HIBAG models, which is available at https://hibag.s3.amazonaws.com/hlares_index.html

### plink_bed_file

A PLINK binary .bed file containing the MHC region; corresponding .fam and .bim files are assumed as secondary files.


### allele_config_file

A file containing the HLA alleles that should be imputed. Each allele should be on a separate line, e.g.

```
A
B
C
```


