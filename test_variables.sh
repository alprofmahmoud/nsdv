#!/bin/bash

func_test_variables_read(){

re='^[0-9]+$'
if  [[ $1 =~ $re ]] ; then
	printf "\e[0;32mDone \e[0m\n"
else 
	fun_exit
	#echo "var is not number" >&2; exit 1
fi
}
function fun_test_urldone_file(){

if test -f $HOME/urldone;
	    then
	    echo "File exists."
    	else
    	touch $HOME/urldone
    	fi
    }
