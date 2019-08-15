cwlVersion: v1.0
class: CommandLineTool
requirements:
    DockerRequirement:
        dockerPull: quay.io/biocontainers/kallisto:0.45.0--hdcc98e5_0
baseCommand: [kallisto, index]
arguments:
    - -i
    - $(inputs.index_file_name)
    - -k
    - $(inputs.kmer_size)
    - $(inputs.fasta)
inputs:
    index_file_name: string
    kmer_size: int
    fasta: File # 今回は複数ファイルを考慮しない
outputs:
    index:
        type: File
        outputBinding:
            glob: $(inputs.index_file_name)
