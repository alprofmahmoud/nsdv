#!/bin/bash

function fun_URL_File(){
for ((counter=1; counter<=4; counter++)); do
fun_options_down_from_url_file	# chosses.sh
read options_uf
func_test_variables_read $options_uf	# test_variables.sh
if (test $options_uf -eq 1)
then
	#vi urlfile_1
	urlfile_1="$HOME/urlfile_1"
	url_ln_nmbr=`cat $HOME/urldone | wc -l`

	for url in $(cat "$urlfile_1")
	do
		((url_ln_nmbr+=1))
		printf "\e[0;36m$url_ln_nmbr \e[0m\n"
		yt-dlp -F $url
		echo "Enter ID formatting for video"
		read ID_format_uf
		fun_output	# output.sh
		Format_option="-f"
		yt-dlp $Format_option $ID_format_uf $lcte $url
		echo $url_ln_nmbr $url >> $HOME/urldone
		sed -i 1d $HOME/urlfile_1
	done
break
elif (test $options_uf -eq 2)
then
	fun_format_vid_down #single.sh

elif (test $options_uf -eq 3)
then
	fun_output	# output.sh

elif (test $options_uf -eq 8)
then

url_ln_nmbr=`cat $HOME/urldone | wc -l`
	urlfile_2="$HOME/urlfile_2"
	for url in $(cat "$urlfile_2")
	do
		((url_ln_nmbr+=1))
		printf "\e[0;36m$url_ln_nmbr \e[0m\n"
		echo $url_ln_nmbr $url >> $HOME/urldone
		sed -i 1d $HOME/urlfile_2
		yt-dlp $Format_video $url $lcte
	done


break
else
	fun_exit
fi
done

}


