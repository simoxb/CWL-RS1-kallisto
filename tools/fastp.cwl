class: CommandLineTool
cwlVersion: v1.2
  
label: fastp

hints:
    DockerRequirement:
        dockerPull: nanozoo/fastp


baseCommand: [fastp, --detect_adapter_for_pe]

arguments:
    - prefix: -o
      valueFrom: $(inputs.read1.nameroot).fastp.fq
    - prefix: -O
      valueFrom: $(inputs.read2.nameroot).fastp.fq


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


outputs:
    trimmed_read1:
        type: File
        outputBinding:
          glob: $(inputs.read1.nameroot).fastp.fq
    trimmed_read2:
        type: File
        outputBinding:
          glob: $(inputs.read2.nameroot).fastp.fq
