class: CommandLineTool
cwlVersion: v1.2
  
label: kallisto_index

hints:
    DockerRequirement:
        dockerPull: zlskidmore/kallisto

baseCommand: [bash]

inputs:
    kallisto_script:
        type: File
        inputBinding: 
            position: 10
    index: 
        type: File
        inputBinding:
            position: 11
    gtf:
        type: File
        inputBinding:
            position: 12
    strandedness: 
        type: string
        inputBinding: 
            position: 13
    read1:
        type: File
        inputBinding:
            position: 14
    read2: 
        type: File
        inputBinding:
            position: 15
       
outputs:
    tsv:
        type: File
        outputBinding:
          glob: abundance.tsv     
    bam:
        type: File
        outputBinding:
          glob: pseudoalignments.bam     
