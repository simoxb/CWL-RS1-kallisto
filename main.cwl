class: Workflow
cwlVersion: v1.2


requirements:
    - class: ScatterFeatureRequirement
    - class: SubworkflowFeatureRequirement

inputs:
    read1: File[]
    read2: File[]
    gtf: File
    ref_cdna: File
    transcriptome: File
    basedir: Directory
    single_end: int[]
    
steps:
  
  kallisto_index:
    run: ./tools/kallisto_index.cwl
    in: 
      transcriptome: transcriptome
    out: [ index ]
    
  read_processing: 
    run: ./subworkflows/read_processing.cwl
    scatter: [ read1, read2, single_end ]
    scatterMethod: dotproduct
    in:
      index: kallisto_index/index
      read1: read1
      read2: read2
      gtf: gtf
      ref_cdna: ref_cdna
      basedir: basedir
      single_end: single_end
    out:
      [ tsv, bam ]    
      
outputs:
  tsv:
    type: File[]
    outputSource: read_processing/tsv
  bam: 
    type: File[]
    outputSource: read_processing/bam
