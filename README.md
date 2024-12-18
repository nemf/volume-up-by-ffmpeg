# Audio Volume Normalizer

## Description
This script normalizes the volume of an audio file by detecting its maximum volume and adjusting it accordingly. The output is saved with the current date as the filename.

## Requirements
- Bash shell
- FFmpeg

## Usage
- ./volup.sh <input_file>

### Arguments
- `<input_file>`: Path to the input audio file

## Features
- Detects the maximum volume of the input audio file
- Adjusts the volume to normalize it
- Saves the output file with the current date as the filename (format: YYYYMMDD.extension)
- Preserves the original input file
- Uses a temporary file for processing to ensure data integrity

## Example
- ./volp.sh myaudio.m4a

This will create a new file named something like `20241218.m4a` (assuming today's date is December 18, 2024) with normalized volume.

## Output
The script will display:
1. The detected maximum volume
2. Progress of the volume adjustment process
3. The name of the output file upon completion

## Notes
- The script requires write permissions in the current directory
- Make sure you have sufficient disk space for temporary and output files
- The original file remains unchanged

## Error Handling
The script will exit with an error message if:
- The input file doesn't exist
- No input file is specified

## Author
nemf

## Version
1.0.0
