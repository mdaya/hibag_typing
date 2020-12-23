class: CommandLineTool
cwlVersion: v1.0
label: HIBAG
$namespaces:
  sbg: https://sevenbridges.com

requirements:
- class: ShellCommandRequirement
- class: DockerRequirement
  dockerPull: quay.io/mdaya/hibag_typing:1.0

inputs:
- id: pre_trained_rdata_file
  label: pre_trained_rdata_file
  doc: |-
    A RData file containing pre-trained HIBAG models, which is available at https://hibag.s3.amazonaws.com/hlares_index.html
  type: File
  inputBinding:
    position: 1
    shellQuote: false
- id: plink_bed_file
  label: plink_bed_file
  doc: |-
    A PLINK binary .bed file containing the MHC region; corresponding .fam and .bim files are assumed as secondary files.
  type: File
  secondaryFiles:
  - ^.fam
  - ^.bim
  inputBinding:
    position: 2
    shellQuote: false
- id: allele_config_file
  label: allele_config_file
  doc: |-
    A file containing the HLA alleles that should be imputed. Each allele should be on a separate line, e.g.
    A
    B
    C
  type: File
  inputBinding:
    position: 3
    shellQuote: false

outputs:
- id: HLA_values
  label: HLA_values
  doc: |-
    An output file that contains the 2 most probable HLA alleles per sample, and the genotype call posterior probability
  type: File
  outputBinding:
    glob: '*HLA_*_value.txt'
- id: HLA_postprob
  label: HLA_postprob
  doc: |-
    A file containing all possible HLA alleles per sample, with their posterior probabilities
  type: File
  outputBinding:
    glob: '*HLA_*_postprob.txt'

baseCommand:
- bash /home/run_hibag.sh

hints:
- class: sbg:AWSInstanceType
  value: c4.2xlarge;ebs-gp2;1024
id: https://api.sb.biodatacatalyst.nhlbi.nih.gov/v2/apps/midaya/hibag/hibag/1/raw/
sbg:appVersion:
- v1.0
sbg:content_hash: a3a2980c660bc22ceb00e797759f8981e476340d2434daa2f4b3886b2bc21c7ab
sbg:contributors:
- midaya
sbg:createdBy: midaya
sbg:createdOn: 1598451456
sbg:id: midaya/hibag/hibag/1
sbg:image_url:
sbg:latestRevision: 1
sbg:modifiedBy: midaya
sbg:modifiedOn: 1598452288
sbg:project: midaya/hibag
sbg:projectName: HIBAG
sbg:publisher: sbg
sbg:revision: 1
sbg:revisionNotes: Version 1
sbg:revisionsInfo:
- sbg:modifiedBy: midaya
  sbg:modifiedOn: 1598451456
  sbg:revision: 0
  sbg:revisionNotes:
- sbg:modifiedBy: midaya
  sbg:modifiedOn: 1598452288
  sbg:revision: 1
  sbg:revisionNotes: Version 1
sbg:sbgMaintained: false
sbg:validationErrors: []
