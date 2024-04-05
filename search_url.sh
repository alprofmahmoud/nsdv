#!/bin/bash


function fun_search_for_url(){

z=$(grep -o $v_url $HOME/urldone)
    url_ln_nmbr="$(grep -n $v_url $HOME/urldone | head -n 1 | cut -d: -f1)"

if [ "$v_url" == "$z" ]
    then
        v_status="found"
        lngth_v_status=$(expr length "$v_status")
        nmbr_dash_=$((lngth_v_status + 2))
        dash_lft_=$(printf '%.s-' $(seq $nmbr_dash_))
        
        lngth_sctn_a="$url_ln_nmbr/$1"
        lngth_lct=$(expr length "$lngth_sctn_a")
        lngth_lct=$((lngth_lct + 2))
        dash_=$(printf '%.s-' $(seq $lngth_lct))


	echo "+$dash_+$dash_lft_+"
	printf "| \e[0;36m$url_ln_nmbr/$1\e[0m |\e[0;33m $v_status \e[0m|\n"
	echo "+$dash_+$dash_lft_+"
else
    echo $v_url >> $HOME/urldone
    url_ln_nmbr="$(grep -n $v_url $HOME/urldone | head -n 1 | cut -d: -f1)"
        v_status="not found"
        lngth_v_status=$(expr length "$v_status")
        nmbr_dash_=$((lngth_v_status + 2))
        dash_lft_=$(printf '%.s-' $(seq $nmbr_dash_))
        
    if [[ ! -v location ]]
        then 
        lngth_sctn_a="$url_ln_nmbr/$1"
        lngth_v_status=$(expr length "$v_status")
        lngth_lct=$(expr length "$lngth_sctn_a")
        lngth_lct=$((lngth_lct + 2))
        dash_=$(printf '%.s-' $(seq $lngth_lct))

        else
            lngth_sctn_a="$url_ln_nmbr/$1"
            lngth_lct=$(expr length "$lngth_sctn_a")
            lngth_lct=$((lngth_lct + 2))
            dash_=$(printf '%.s-' $(seq $lngth_lct))

    fi

	echo "+$dash_+$dash_lft_+"
	printf "| \e[0;36m$url_ln_nmbr/$1\e[0m |\e[0;33m $v_status\e[0m |\n"
	    echo "+$dash_+$dash_lft_+"

    fi
}

