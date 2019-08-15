cwlVersion: v1.0
class: Workflow
inputs:
    # これら５ファイルは、手順１でダウンロードでしてきている
    - id: fasta
      type: File
    - id: fastq1
      type: File
    - id: fastq2
      type: File
    - id: whitelist
      type: File
    - id: transcripts_to_genes
      type: File
steps:
    - id: kallisto-index
      run: kallisto-index.cwl
      in:
        - id: index_file_name
          default: ki.idx
        - id: kmer_size
          default: 31
        - id: fasta
          source: fasta
      out: [index]
    - id: kallisto-bus
      run: kallisto-bus.cwl
      in:
        - id: index
          source: kallisto-index/index
        - id: outdir
          default: outdir
        - id: sctechnology
          default: 10xv2
        - id: threads
          default: 4
        - id: fastq1
          source: fastq1
        - id: fastq2
          source: fastq2
      out: [matrix, bus, transcripts]
    - id: bustools-correct
      run: bustools-correct.cwl
      in:
        - id: whitelist
          source: whitelist
        - id: bus_file
          source: kallisto-bus/bus
      out: [out]
    - id: bustools-sort
      run: bustools-sort.cwl
      in:
        - id: bus_file
          source: bustools-correct/out
      out: [out]
    - id: bustools-count
      run: bustools-count.cwl
      in:
        - id: genes_prefix
          default: genes
        - id: transcripts_to_genes
          source: transcripts_to_genes
        - id: matrix
          source: kallisto-bus/matrix
        - id: transcripts
          source: kallisto-bus/transcripts
        - id: sorted_bus_file
          source: bustools-sort/out
      out: [barcode, genes, mtx]
outputs:
    - id: barcode
      type: File
      outputSource: bustools-count/barcode
    - id: genes
      type: File
      outputSource: bustools-count/genes
    - id: mtx
      type: File
      outputSource: bustools-count/mtx
