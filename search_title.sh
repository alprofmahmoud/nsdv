#!/bin/bash

function fun_search_for_title(){
if test -f $HOME/name_reels;
        then
            sleep 0.1;
            echo "wait"
        else
    touch $HOME/name_reels
        fi
    


    total_title=`grep -c "." $HOME/v_title`
    v_title=$(sed -n "$total_title"p $HOME/v_title)

    z=$(grep -o "$v_title" "$HOME/name_reels")

    if [ "$v_title" == "$z" ]
        then
    title_ln_nmbr=$(grep -m1 -no "$z" "$HOME/name_reels" | cut -d: -f1)

    ((title_ln_nmbr-=1))
    v_location=$(sed -n "$title_ln_nmbr"p $HOME/name_reels)

    v_status="found"
    optn_dlt="delete video"
    optn_skp="skip delete"
    rtrn_dwnld="return download"

    
    lngth=$(expr length "$space")
    lngth_v_location=$(expr length "$v_location")
    lngth_v_status=$(expr length "$v_status")
    lngth_v_dlt=$(expr length "$optn_dlt")
    lngth_v_skp=$(expr length "$optn_skp")
    lngth_v_rtrn=$(expr length "$rtrn_dwnld")

    nmbr_spc_lct=`expr 31 - $lngth_v_location`

    nmbr_spc_slct=$((lngth_v_location % 2)) 
    lngth_lct=$lngth_v_location

    if (test $lngth_v_location -gt 1)
    then
        # An odd number
        if (test $nmbr_spc_slct -eq 1 )
        then
            nmbr_spc_stts=`expr 39 - $lngth_v_location - $lngth_v_status`
            nmbr_spc_dlt=`expr 41 - $lngth_v_location - $lngth_v_dlt`
            nmbr_spc_skp=`expr 41 - $lngth_v_location - $lngth_v_skp` 
            nmbr_spc_rtrn=`expr 41 - $lngth_v_location - $lngth_v_rtrn` 

            nmbr_spc_slct_rght=$((lngth_v_location / 2)) 
            nmbr_spc_slct_lft=$((lngth_v_location / 2)) 
            spc_slct_rght=$(printf '%.s ' $(seq $nmbr_spc_slct_rght))
            spc_slct_lft=$(printf '%.s ' $(seq $nmbr_spc_slct_lft))

        elif (test $nmbr_spc_slct -eq 0)
        then
        # double
            nmbr_spc_stts=`expr 39 - $lngth_v_location - $lngth_v_status`
            nmbr_spc_dlt=`expr 41 - $lngth_v_location - $lngth_v_dlt`
            nmbr_spc_skp=`expr 41 - $lngth_v_location - $lngth_v_skp`
            nmbr_spc_rtrn=`expr 41 - $lngth_v_location - $lngth_v_rtrn` 
    
            ((lngth_lct++))
            nmbr_spc_slct_rght=$((lngth_v_location / 2)) 
            nmbr_spc_slct_lft=$((lngth_v_location / 2)) 
            spc_slct_rght=$(printf '%.s ' $(seq $nmbr_spc_slct_rght))
            spc_slct_lft=$(printf '%.s ' $(seq $nmbr_spc_slct_lft))
        fi
    
   fi
    
    if (test $nmbr_spc_slct -eq 0)
        then
            space_right=" "
            lngth_v_location=$((lngth_v_location + 3))
            dash=$(printf '%.s-' $(seq $lngth_v_location))
            nmbr_dash=$((lngth_v_status + nmbr_spc_stts + 3))
            dash_lft=$(printf '%.s-' $(seq $nmbr_dash))
        elif (test $nmbr_spc_slct -eq 1)
        then 
            space_right=""
            lngth_v_location=$((lngth_v_location + 2))
            dash=$(printf '%.s-' $(seq $lngth_v_location))
            nmbr_dash=$((lngth_v_status + nmbr_spc_stts + 3))
            dash_lft=$(printf '%.s-' $(seq $nmbr_dash))

    fi

	echo "+$dash+$dash_lft+"
        printf "| \e[0;36m$v_location\e[0m$space_right |\e[0;33m $v_status \e[0m $(printf '%.s ' $(seq $nmbr_spc_stts))|\n"

	echo "+$dash+$dash_lft+"
        echo "|$spc_slct_lft 1 $spc_slct_rght| $optn_dlt$(printf '%.s ' $(seq $nmbr_spc_dlt))|"
	echo "+$dash+$dash_lft+"
        echo "|$spc_slct_lft 2 $spc_slct_rght| $optn_skp$(printf '%.s ' $(seq $nmbr_spc_skp))|"
    echo "+$dash+$dash_lft+"
        echo "|$spc_slct_lft 3 $spc_slct_rght| $rtrn_dwnld$(printf '%.s ' $(seq $nmbr_spc_rtrn))|"
	echo "+$dash+$dash_lft+"

    echo "Select action"
   

   read slct_
func_test_variables_read $slct_
   if ( test $slct_ -eq 1)
   then
    this_is_video="$lcte_name_/$v_title"

    ls -l "$lcte_name_/$v_title"
    rm -rf "$lcte_name_/$v_title"

    printf "\e[0;32mDone delete ✅️\e[0m\n"

    elif (test $slct_ -eq 2)
    then
       echo "Skip delete video..."
   elif (test $slct_ -eq 3)
    then
        fun_yt_dlp
   else
       fun_exit
   fi
        else
    v_status="not found"
    lngth_v_status=$(expr length "$v_status")
    lngth_lct=$(expr length "$location")
    nmbr_spc_lct=`expr 31 - $lngth_lct`
    nmbr_spc_stts=`expr 39 - $lngth_lct - $lngth_v_status`

    lngth_lct=$((lngth_lct + 2))
    dash=$(printf '%.s-' $(seq $lngth_lct))
    nmbr_dash=$((lngth_v_status + nmbr_spc_stts + 3))
    dash_lft=$(printf '%.s-' $(seq $nmbr_dash))


	echo "+$dash+$dash_lft+"
    printf "| \e[0;36m$location\e[0m |\e[0;33m $v_status \e[0m $(printf '%.s ' $(seq $nmbr_spc_stts))|\n"
	echo "+$dash+$dash_lft+"
 
    echo $location >> $HOME/name_reels
    echo $v_title >> $HOME/name_reels

           fi
}

