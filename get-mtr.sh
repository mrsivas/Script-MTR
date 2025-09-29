#!/bin/bash

# call this script like "./get-mtr.sh 192.168.0.1 100"

# Define the target host (e.g., a website or IP address)
TARGET_HOST= $1   #first parameter

# Define the number of packets to send for the report
PACKET_COUNT=$2   #second parmeter

# Define the output file for the MTR report
OUTPUT_FILE="mtr_report_${TARGET_HOST}_$(date +%Y%m%d_%H%M%S).txt"

echo "Generating MTR report for ${TARGET_HOST} with ${PACKET_COUNT} packets..."

# Execute mtr in report mode (-r) with a specified packet count (-c)
# and save the output to the defined file.
# The -n option prevents DNS resolution for faster execution and
# to display IP addresses directly.
mtr -r -c "${PACKET_COUNT}" -n "${TARGET_HOST}" > "${OUTPUT_FILE}"

# Check if the mtr command was successful
if [ $? -eq 0 ]; then
    echo "MTR report saved to: ${OUTPUT_FILE}"
    echo "Contents of the report:"
    cat "${OUTPUT_FILE}"
else
    echo "Error generating MTR report. Please ensure 'mtr' is installed and accessible."
fi
