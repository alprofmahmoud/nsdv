#!/bin/bash


function fun_yt_dlp(){
	if [[ -v format_id ]]
	then
	url_ln_nmbr=`cat $HOME/urldone | wc -l`
	urlfile_2="$HOME/urlfile_2"
	((url_ln_nmbr+=1))
	printf "\e[0;36m$url_ln_nmbr \e[0m\n"
	echo $url_ln_nmbr $v_url >> $HOME/urldone
	
	yt-dlp $conv_thumb $ppa_thumb $write_thumb $skp $Format_list $Format_video $pl_s $S_item $pl_e $E_item $List_subs $Write_sub $Sub_lang $lng $write_auto_sub $lcte $v_url
	else

	yt-dlp $conv_thumb $ppa_thumb $write_thumb $skp $Format_list $Format_video $pl_s $S_item $pl_e $E_item $List_subs $Write_sub $Sub_lang $lng $write_auto_sub $lcte $v_url
fi
}
