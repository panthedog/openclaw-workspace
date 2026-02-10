#!/bin/bash
# Quick Audio Transcription Script
# Usage: ./transcribe.sh <audio_file>
# Example: ./transcribe.sh message.ogg

AUDIO_FILE="$1"
OUTPUT_DIR="${2:-/tmp}"

if [ -z "$AUDIO_FILE" ]; then
    echo "Usage: ./transcribe.sh <audio_file> [output_dir]"
    exit 1
fi

# Convert to WAV if needed
if [[ "$AUDIO_FILE" == *.ogg || "$AUDIO_FILE" == *.opus ]]; then
    WAV_FILE="${OUTPUT_DIR}/audio_temp.wav"
    ffmpeg -i "$AUDIO_FILE" -ar 16000 -ac 1 -c:a pcm_s16le "$WAV_FILE" -y 2>/dev/null
    AUDIO_FILE="$WAV_FILE"
fi

# Transcribe with tiny model (fastest)
whisper --model tiny "$AUDIO_FILE" 2>/dev/null

# Cleanup
[ -f "${OUTPUT_DIR}/audio_temp.wav" ] && rm "${OUTPUT_DIR}/audio_temp.wav"

echo ""
echo "Done!"
