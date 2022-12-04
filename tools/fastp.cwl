class: CommandLineTool
cwlVersion: v1.2
  
label: fastp

hints:
    DockerRequirement:
        dockerPull: nanozoo/fastp


baseCommand: [fastp, --detect_adapter_for_pe]

inputs:
    read1:
        type: File
        inputBinding:
            position: 11
            prefix: '-i'
    read2:
        type: File
        inputBinding:
            position: 12
            prefix: '-I'
    fastp1:
        type: string
        inputBinding:
            position: 13
            prefix: '-o'
    fastp2:
        type: string
        inputBinding:
            position: 14
            prefix: '-O'
           


outputs:
    trimmed_read1:
        type: File
        outputBinding:
          glob: $(inputs.fastp1)
    trimmed_read2:
        type: File
        outputBinding:
          glob: $(inputs.fastp2)  
