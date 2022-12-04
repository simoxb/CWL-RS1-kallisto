class: CommandLineTool
cwlVersion: v1.2
  
label: kallisto_index

hints:
    DockerRequirement:
        dockerPull: zlskidmore/kallisto

baseCommand: [kallisto, index]

arguments: ["-i", kallisto.index]

inputs:
    transcriptome:
        type: File
        inputBinding:
            position: 11
       
outputs:
    index:
        type: File
        outputBinding:
          glob: kallisto.index
          

