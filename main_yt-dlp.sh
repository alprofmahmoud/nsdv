#!/bin/bash
. $PATH/nsdv/search_url.sh
. $PATH/nsdv/search_title.sh

function fun_yt_dlp(){
	if [[ -v format_id ]]
	then

        rplc_mtdt_optn="--replace-in-metadata"
        tmp_arg="title"
        rplc_arg1="[|,｜.*]"
        rplc_arg2="_"
        prnt_t_fl="--print-to-file"
        vd_nm="%(title).200B.%(ext)s"
        fl_nm="$HOME/v_title"

	if test -f $HOME/urldone;
	then
	echo "File exists."
	else
	touch $HOME/urldone
	fi
    yt-dlp $rplc_mtdt_optn "$tmp_arg" "$rplc_arg1" $rplc_arg2 $prnt_t_fl $vd_nm $fl_nm $conv_thumb $ppa_thumb $write_thumb $skp $Format_list $Format_video $pl_s $S_item $pl_e $E_item $List_subs $Write_sub $Sub_lang $lng $write_auto_sub $option_out $lcte $v_url
    fun_search_for_title
	else
       yt-dlp $conv_thumb $ppa_thumb $write_thumb $skp $Format_list $Format_video $pl_s $S_item $pl_e $E_item $List_subs $Write_sub $Sub_lang $lng $write_auto_sub $option_out $lcte $v_url
fi
}
