#!/bin/bash
. $PATH/nsdv/search_url.sh
. $PATH/nsdv/test_variables.sh
. $PATH/nsdv/search_title.sh


function fun_URL_File(){
        rplc_mtdt_optn="--replace-in-metadata"
        tmp_arg="title"
        rplc_arg1="[|,｜.*]"
        rplc_arg2="_"
        prnt_t_fl="--print-to-file"
        vd_nm="%(title).200B.%(ext)s"
        fl_nm="$HOME/v_title"

for ((counter=1; counter<=4; counter++)); do
fun_options_down_from_url_file	# chosses.sh
read options_uf
func_test_variables_read $options_uf	# test_variables.sh
if (test $options_uf -eq 1)
then
    fun_test_urldone_file
    urlfile_1="$HOME/urlfile_1"
	url_ln_nmbr=`cat $HOME/urldone | wc -l`

	for v_url in $(cat "$urlfile_1")
	do
        total_url=`grep -c "." $HOME/urlfile_1`
        fun_search_for_url $total_url
		yt-dlp -F $v_url
		echo "Enter ID formatting for video"
		read ID_format_uf
        Format_video="-f $ID_format_uf"
		fun_output	# output.sh
		yt-dlp $rplc_mtdt_optn "$tmp_arg" "$rplc_arg1" $rplc_arg2 $prnt_t_fl $vd_nm $fl_nm $Format_video $v_url $option_out $lcte
        fun_search_for_title
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
    fun_test_urldone_file
    url_ln_nmbr=`cat $HOME/urldone | wc -l`
	urlfile_2="$HOME/urlfile_2"
	for v_url in $(cat "$urlfile_2")
	do
		sed -i 1d $HOME/urlfile_2
        total_url=`grep -c "." $HOME/urlfile_2`
        fun_search_for_url $total_url
		yt-dlp $rplc_mtdt_optn "$tmp_arg" "$rplc_arg1" $rplc_arg2 $prnt_t_fl $vd_nm $fl_nm $Format_video $v_url $option_out $lcte
        fun_search_for_title
	done


break
else
	fun_exit
fi
done

}


