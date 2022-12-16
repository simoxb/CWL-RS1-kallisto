class: Workflow
cwlVersion: v1.2

inputs:
    read1: File
    read2: File
    gtf: File
    ref_cdna: File
    transcriptome: File
    basedir: Directory
    
steps:
  fastp:
    run: ./tools/fastp.cwl
    in:
      read1: read1
      read2: read2
    out: [ trimmed_read1, trimmed_read2 ]
    
  check_strandedness:
    run: ./tools/check_strandedness.cwl
    in:
      read1: read1  
      read2: read2
      gtf: gtf
      ref_cdna: ref_cdna
      basedir: basedir
    out: [ strandedness ]
  
  kallisto_index:
    run: ./tools/kallisto_index.cwl
    in: 
      transcriptome: transcriptome
    out: [ index ]
    
  kallisto_quant:
    run: ./tools/kallisto_quant.cwl
    in:
      basedir: basedir
      index: kallisto_index/index
      gtf: gtf
      strandedness: check_strandedness/strandedness
      read1: fastp/trimmed_read1
      read2: fastp/trimmed_read2   
    out: [ tsv, bam ]
    
outputs:
  trimmed_read1:
    type: File
    outputSource: fastp/trimmed_read1
  trimmed_read2:
    type: File
    outputSource: fastp/trimmed_read2
  tsv:
    type: File
    outputSource: kallisto_quant/tsv
  bam: 
    type: File
    outputSource: kallisto_quant/bam
