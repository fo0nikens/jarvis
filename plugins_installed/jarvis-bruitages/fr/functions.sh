# /bin/bash

jv_pg_ct_faitceci() {
if [[ "$memoirefait" = "r2" ]]; then
memoirefait="r2d2"
fi
vercheminetmax

if [[ "$max" == "0" ]]; then 
say "Aïe, je ne trouve pas le bruitage $memoirefait que tu me demandes, désolé"
return
fi

if [[ "$racine" == "1" ]]; then 
aplay -q $chemin/$memoirefait.wav
return
fi

line=$(($RANDOM%`ls $chemin/$memoirefait/*.wav | wc -l`))
line=$((line + 1)) 
ls $chemin/$memoirefait/*.wav | nl | while read a b 
do
if [[ "$a" = "$line" ]]; then
aplay -q $b
fi
done


}

jv_pg_ct_quefaitceci() {
vercheminetmax
titrejesais=`ls -r $chemin | sed -e "s/.wav//g" | tr '\n' ',' | sed  's/,/, /g'`
say  $titrejesais
}


vercheminetmax() {
chemin="$PWD/plugins_installed/jarvis-bruitages/bruitages"
memoirefait=`echo $memoirefait | sed 's/.* //'`
max=`ls $chemin/$memoirefait 2>/dev/null  | wc -l`
# echo "$chemin/$memoirefait $max"
if [[ "$max" == "0" ]]; then
max=`ls $chemin/$memoirefait.wav 2>/dev/null | wc -l`
	if [[ "$max" == "1" ]]; then 
	racine="1"
	else
	racine="0"
	fi

fi

}

forcingbruitage() {
aplay -q /home/pi/jarvis/plugins_installed/jarvis-bruitages/bruitages/chien/chien-0.wav
}
