#!/bin/bash

pre_trained_rdata_file_name=$1
bed_fn=$2
allele_config_file=$3

bim_fn=`echo $bed_fn | sed 's/.bed/.bim/'`
fam_fn=`echo $bed_fn | sed 's/.bed/.fam/'`
rdata_prefix=`basename $pre_trained_rdata_file_name | sed 's/.RData//I'`
plink_prefix=`basename $bed_fn | sed 's/.bed//'`
out_fn_prefix=${plink_prefix}_${rdata_prefix}

cat /home/run_hibag.R | R --vanilla --args $pre_trained_rdata_file_name $bed_fn $bim_fn $fam_fn $allele_config_file $out_fn_prefix
