# Script-MTR
Script to get MTR result with arguments like IP, Packet count


### call this script like 
```./get-mtr.sh 192.168.0.1 100```


#Explanation:     

#!/bin/bash: This is the shebang line, specifying that the script should be executed with Bash. 

TARGET_HOST="example.com": This variable stores the hostname or IP address that mtr will target. 

PACKET_COUNT=10: This variable sets the number of packets mtr will send to each hop. 

OUTPUT_FILE="mtr_report_${TARGET_HOST}_$(date +%Y%m%d_%H%M%S).txt": This creates a unique filename for the report, incorporating the target host and a timestamp. 

mtr -r -c "\(PACKET_{C}OUNT"-n"\){TARGET_HOST}" > "${OUTPUT_FILE}": This is the core mtr command: -r: Enables report mode, which sends a specified number of packets and then exits, printing a summary. 

-c "${PACKET_COUNT}": Specifies the number of packets to send (defined by PACKET_COUNT). 

-n: Prevents mtr from resolving IP addresses to hostnames, which can be faster and provides raw IP data.

"${TARGET_HOST}": The target host for the mtr test. > "${OUTPUT_FILE}": Redirects the standard output of the mtr command to the specified OUTPUT_FILE. 

if [ $? -eq 0 ]; then ... else ... fi: This checks the exit status of the mtr command ($?). If it's 0, the command was successful; otherwise, an error occurred. The script then prints appropriate messages and displays the report content if successful.          

Usage:     Save the script to a file, for example, get_mtr_report.sh. Make the script executable: 

```chmod +x get_mtr_report.sh```. 

Run the script: ```./get_mtr_report.sh```.           

The MTR report will be saved in a file named similar to ``` mtr_report_example.com_20250929_095700.txt ``` in the same directory where the script is executed. The contents of the report will also be printed to the console.
