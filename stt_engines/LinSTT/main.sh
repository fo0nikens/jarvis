#!/bin/bash

IP_SERVER="$(cat $PWD/config/linstt_api_key)"

_LinSTT_transcribe () {
	# envoi l'audio file a kaldi_gstreamer et recupere la transcription
	transcript=$(curl -X POST http://${IP_SERVER}:3000/api/transcript -H "Content-type: audio/wave" --data-binary "@$audiofile")
	transcribed=$(echo $transcript | grep -o "\[.*\]" | sed "s/\}\]//g" | sed "s/\[{//g" | sed "s/\"//g" | sed "s/\utterance://g")
    say "$transcribed"
    echo $transcribed > $forder
}

LinSTT_STT () { # recupere l'audio file et faite appel a la fonction _LinSTT_transcribe
    LISTEN $audiofile || return $?
    _LinSTT_transcribe &
    jv_spinner $!
}
 
