cwlVersion: v1.0
class: CommandLineTool
requirements:
    DockerRequirement:
        dockerPull: quay.io/biocontainers/kallisto:0.45.0--hdcc98e5_0
baseCommand: [kallisto, bus]
arguments:
    - -i
    - $(inputs.index)
    - -o 
    - $(inputs.outdir)
    - -x
    - $(inputs.sctechnology)
    - -t
    - $(inputs.threads)
    - $(inputs.fastq1)
    - $(inputs.fastq2)
inputs:
    index: File
    outdir: string
    sctechnology: string
    threads: int
    fastq1: File
    fastq2: File
outputs:
    # ディレクトリまるごと取得する方法
    # result:
    #    type: Directory
    #    outputBinding:
    #        glob: $(inputs.outdir)
    matrix:
        type: File
        outputBinding:
            glob: $(inputs.outdir)/matrix.ec
    bus:
        type: File
        outputBinding:
            glob: $(inputs.outdir)/output.bus
    transcripts:
        type: File
        outputBinding:
            glob: $(inputs.outdir)/transcripts.txt
