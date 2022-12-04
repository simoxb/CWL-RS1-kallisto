class: CommandLineTool
cwlVersion: v1.2
  
label: check_strandedness

hints:
    DockerRequirement:
        dockerPull: ninedem/check_strandedness

baseCommand: [bash]

inputs:
    strandedness_script:
        type: File
        inputBinding:
            position: 11
    read1:
        type: File
        inputBinding:
            position: 12
    read2:
        type: File
        inputBinding:
            position: 13
    gtf:
        type: File
        inputBinding:
            position: 14
    ref_cdna:
        type: File
        inputBinding:
            position: 15
       
outputs:
    strandedness:
        type: string
        outputBinding:
          glob: strandedness.txt
          loadContents: true
          outputEval: $(self[0].contents)


