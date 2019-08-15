cwlVersion: v1.0
class: CommandLineTool
requirements:
    DockerRequirement:
        dockerPull: bustools:0.39.3
baseCommand: [bustools, correct] 
arguments: 
    - -w 
    - $(inputs.whitelist) 
    - -p
    - $(inputs.bus_file)  
inputs: 
    whitelist: File
    bus_file: File
outputs:
  - id: out
    type: stdout
stdout: output.txt


#bustools correct -w ../10xv2_whitelist.txt -p output.bus 
# > bustools correct
# Usage: bustools correct [options] bus-files

# Options: 
# -o, --output          File for corrected bus output
# -w, --whitelist       File of whitelisted barcodes to correct to
# -p, --pipe            Write to standard output

# bustools:0.39.3