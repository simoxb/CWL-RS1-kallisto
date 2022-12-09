class: CommandLineTool
cwlVersion: v1.2
  
label: check_strandedness

hints:
    DockerRequirement:
        dockerPull: ninedem/check_strandedness

baseCommand: [bash]

arguments:
    - position: 1
      valueFrom: $(inputs.basedir.path)/bin/check_strandedness.sh



inputs:
    basedir:
        type: Directory
    read1:
        type: File
        inputBinding:
            position: 2
    read2:
        type: File
        inputBinding:
            position: 3
    gtf:
        type: File
        inputBinding:
            position: 4
    ref_cdna:
        type: File
        inputBinding:
            position: 5
       
outputs:
    strandedness:
        type: string
        outputBinding:
          glob: strandedness.txt
          loadContents: true
          outputEval: $(self[0].contents)


