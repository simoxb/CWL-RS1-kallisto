class: CommandLineTool
cwlVersion: v1.2
  
label: fastp

hints:
    DockerRequirement:
        dockerPull: nanozoo/fastp


baseCommand: [bash]

arguments:
    - position: 1
      valueFrom: $(inputs.basedir.path)/bin/fastp.sh
    - position: 2
      valueFrom: $(inputs.read1.nameroot).fastp.fq
    - position: 3
      valueFrom: $(inputs.read2.nameroot).fastp.fq


inputs:
    basedir:
        type: Directory
    read1:
        type: File
        inputBinding:
            position: 4
    read2:
        type: File
        inputBinding:
            position: 5
    single_end:
        type: int
        inputBinding: 
            position: 6


outputs:
    trimmed_read1:
        type: File
        outputBinding:
          glob: $(inputs.read1.nameroot).fastp.fq
    trimmed_read2:
        type: File
        outputBinding:
          glob: $(inputs.read2.nameroot).fastp.fq
