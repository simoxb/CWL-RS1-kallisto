class: Workflow
cwlVersion: v1.2

requirements:
    - class: ScatterFeatureRequirement
    - class: SubworkflowFeatureRequirement

inputs: 
    index: File
    read1: File
    read2: File
    gtf: File
    ref_cdna: File
    basedir: Directory
     
steps:
    
  fastp:
    run: ../tools/fastp.cwl
    in:
      read1: read1
      read2: read2
    out: [ trimmed_read1, trimmed_read2 ]
    
  check_strandedness:
    run: ../tools/check_strandedness.cwl
    in:
      read1: read1  
      read2: read2
      gtf: gtf
      ref_cdna: ref_cdna
      basedir: basedir
    out: [ strandedness ]
    
  kallisto_quant:
    run: ../tools/kallisto_quant.cwl
    in:
      basedir: basedir
      index: index
      gtf: gtf
      strandedness: check_strandedness/strandedness
      read1: fastp/trimmed_read1
      read2: fastp/trimmed_read2   
    out: [ tsv, bam ]
      
outputs:
  tsv:
    type: File
    outputSource: kallisto_quant/tsv
  bam: 
    type: File
    outputSource: kallisto_quant/bam
