cwlVersion: v1.0
class: CommandLineTool
requirements:
    DockerRequirement:
        dockerPull: bustools:0.39.3
baseCommand: [bustools, count] 
arguments: 
    - -o 
    - $(inputs.genes_prefix) 
    - -g 
    - $(inputs.transcripts_to_genes) 
    - -e 
    - $(inputs.matrix)
    - -t 
    - $(inputs.transcripts)
    - --genecounts 
    - $(inputs.sorted_bus_file)
inputs: 
    genes_prefix: string # 元は genecount/genes <=  これの実態は何? File ? string? <= 出力ファイル？
    transcripts_to_genes: File  # 元は　../transcripts_to_genes.txt
    matrix: File 
    transcripts: File
    sorted_bus_file: File   # Sort コマンドからのstdout だったもの
outputs:
  - id: barcode
    type: File
    outputBinding: 
        glob: "$(inputs.genes_prefix).barcodes.txt"
  - id: genes
    type: File
    outputBinding: 
        glob: "$(inputs.genes_prefix).genes.txt"
  - id: mtx
    type: File
    outputBinding: 
        glob: "$(inputs.genes_prefix).mtx"
## bustools:0.39.3 bustools count
# bustools count -o genecount/genes -g ../transcripts_to_genes.txt -e matrix.ec -t transcripts.txt --genecounts -

# > bustools count
# Usage: bustools count [options] sorted-bus-files

# Options: 
# -o, --output          File for corrected bus output
# -g, --genemap         File for mapping transcripts to genes
# -e, --ecmap           File for mapping equivalence classes to transcripts
# -t, --txnames         File with names of transcripts
# --genecounts          Aggregate counts to genes only
# -m, --multimapping    Include bus records that pseudoalign to multiple genes
