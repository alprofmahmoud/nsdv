#!/bin/bash

function fun_defult_lct(){
	lcte="-o /data/data/com.termux/files/home/storage/downloads/down_termux/%(title).200B.%(ext)s"
}

option1="Defult location (down_termux)"
option2="Choose location"

lngth_option1=$(expr length "$option1")
lngth_option2=$(expr length "$option2")

nmbr_spc1=`expr 39 - $lngth_option1`
nmbr_spc2=`expr 39 - $lngth_option2`

function fun_output(){
	if test -f $HOME/lcte_file.txt;
	then
	echo "File exists."
	else
	touch $HOME/lcte_file.txt
	fi

	echo "where are you want save this $type_url?"
	echo "+---+-----------------------------------------+"
	echo "|   | Output in                               |"
	echo "+---+-----------------------------------------+"
	echo "| 1 | $option1 $(printf '%.s ' $(seq $nmbr_spc1))|"
	echo "| 2 | $option2 $(printf '%.s ' $(seq $nmbr_spc2))|"

	filename="$HOME/lcte_file.txt"	
	i=2	
	while read  ; do
	 (( i+=1 ))

	option_n=$REPLY
	lng_option_n=$(expr length "$option_n")
	nmbr_spc_n=`expr 39 - $lng_option_n`

	echo "| $i | $REPLY $(printf '%.s ' $(seq $nmbr_spc_n))|"

	done < $HOME/lcte_file.txt

	echo "+---+-----------------------------------------+"
	echo "Choose"
	read var_out
	func_test_variables_read $var_out
	if (test $var_out -eq 1)
	then
		fun_defult_lct
	elif (test $var_out -eq 2 )
	then
		echo "Enter output location"
		read new_lct_out 
		echo $new_lct_out >> $HOME/lcte_file.txt
		lcte="-o $HOME/storage/downloads/$new_lct_out/$url_ln_nmbr%(title).200B.%(ext)s"
		lines_n=`sed -n '$=' $HOME/lcte_file.txt`
		if (test $lines_n -eq 8)
		then
		:>$HOME/lcte_file.txt
		fi

 
	else
		var_out_n1=`expr $var_out - 2`
		var_out_n2=`expr $var_out_n1 + 2`
		if (test $var_out -eq $var_out_n2)
		then
		lct_list=`sed -n "$var_out_n1"p $HOME/lcte_file.txt`
		lcte="-o $HOME/storage/downloads/$lct_list/%(title).200B.%(ext)s"
	else
		fun_exit
	fi
	fi
}


