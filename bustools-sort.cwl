cwlVersion: v1.0
class: CommandLineTool
requirements:
    DockerRequirement:
        dockerPull: bustools:0.39.3
baseCommand: [bustools, sort] 
arguments: 
    - -p
    - $(inputs.bus_file)
    - -T
    - .
inputs: 
    bus_file: File # 今回は、複数ファイルについて考慮しない (雑に済ませる)
outputs:
  - id: out
    type: stdout
stdout: output_bustools_sort.txt

## bustools:0.39.3 bustools sort
#Usage: bustools sort [options] bus-files
# Options: 
# -t, --threads         Number of threads to use
# -m, --memory          Maximum memory used
# -T, --temp            Location and prefix for temporary files 
#                       required if using -p, otherwise defaults to output
# -o, --output          File for sorted output
# -p, --pipe            Write to standard output