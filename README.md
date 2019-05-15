-------------------------------------------------------
Course:     EEE4120F
Project:    Sea Sounds Data Caster
Group:      03
Members:    HLDDIL001, SNGJEH001
Date:       2019-05-15
-------------------------------------------------------

Repository Description:

A set of programs for encoding bitstreams onto the sound of ocean noises. Each
code uses a different method for encoding. Both are written in Matlab. The
following sections list the files in each directory and the purposes of them,
including usage.

# LSB

## encode.m
This matlab file will encode the binary file `plaintext.bin` and emit
`output.wav`, which contains `plaintext.bin` encoded on ocean noise. Run this
file on its own with matlab to encode the file.

## decode.m
This matlab file will decode the message found in `output.wav`, and print it to
the screen. Run it as a standalone function with matlab.

## brownnoise.wav and mono.wav
These are both source files used to create the sound that will be modulated with
the signal.

## base.wav
This file is the file that will be used for modulation, padded to fit the entire
message, but it does not contain any message.

## plaintext.bin
A binary file which contains the bitstream to be modulated.

## notch_0.m and notch_1.m
These are matlab filter design functions which represent the filters to apply
for 0's and 1's.

## output.wav
This contains the modulated signal, as output by `encode.m`.

# Notch

## Driver.m
Matlab driver code which brings up UI elements to select audio waveforms to encode and messages to encode in said waveforms

## LSB_message_decode.m
Matlab function which is used by the driver to take in a audio file name and load the bits for the file. It will decode the message in an already encoded waveform

## LSB_message_encode.m
Matlab function which takes in a audio file name and message and encodes said
message into the audio file. The output file will be the original file with the
addition of '\_stego' to its filename
	
## Noise_Generation.m
Produces a set of brown noise waveforms with varying modulation frequency. Additionally stiches all the waveforms together sequentially into a single .wav file.

## noise_random_stitching.m
Takes samples from the brown_samples directory and stiteches them together to produce a more natural sounding ocean sound
	
## message_length_test.txt
Message with 11990 characters to full up the LSB space of a file. Is used for testing BER and NC

## message_to_encode.txt
A standard message used during development to ensure encoding is working

## shortmsg.txt
A message one character long to test BER and NC

##brown_samples
Location of a unmodulated brownnoise waveform and some brown noise modulated with varying frequency.

##/testing
Directory with test code for BER and Normalised correlation.

##/testing/NC_driver.m
Driver code to run the normalised correlation between two files

##/testing/BER_driver.m
Driver code to run the BER test between two files

##/testing/BER.m
Code to calculate the BER

##/testing/getBits.m
Code to get the bits in a file

##/testing/max_msg
Directory containing .wav samples with the max message space encoded

##/testing/min_msg
Directory containing .wav samples with the min message space encoded

##/testing/NC.m
Code to perform normalised correlation between files.
