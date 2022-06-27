#!/bin/bash
clear -x;
echo -e "\e[0;32m================ Generate Warp+ license key? ================\033[0m"
echo -e "\t\e[0;32mEnter 1, will be generate new Warp+ license key.\033[0m"
echo -e "\t\e[0;32mPress Enter without entry to skip generate.\033[0m"
echo -e "\e[0;32m=============================================================\033[0m"
echo ""
read -p "Enter 1 to generate or press Enter to skip:" genwarpplus
generate_random_string=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)

replace_ip(){
    clear -x
    echo "Select Endpoint Wireguard:"
    echo
    echo "1)162.159.193.1:2408 10)162.159.193.1:500 19)162.159.193.1:1701 28)162.159.193.1:4500"
    echo "2)162.159.193.2:2408 11)162.159.193.2:500 20)162.159.193.2:1701 29)162.159.193.2:4500"
    echo "3)162.159.193.3:2408 12)162.159.193.3:500 21)162.159.193.3:1701 30)162.159.193.3:4500"
    echo "4)162.159.193.4:2408 13)162.159.193.4:500 22)162.159.193.4:1701 31)162.159.193.4:4500"
    echo "5)162.159.193.5:2408 14)162.159.193.5:500 23)162.159.193.5:1701 32)162.159.193.5:4500"
    echo "6)162.159.193.6:2408 15)162.159.193.6:500 24)162.159.193.6:1701 33)162.159.193.6:4500"
    echo "7)162.159.193.7:2408 16)162.159.193.7:500 25)162.159.193.7:1701 34)162.159.193.7:4500"
    echo "8)162.159.193.8:2408 17)162.159.193.8:500 26)162.159.193.8:1701 35)162.159.193.8:4500"
    echo "9)162.159.193.9:2408 18)162.159.193.9:500 27)162.159.193.9:1701 36)162.159.193.9:4500"
    read -p "Select:" server

    case "$server" in
        "1" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.1:2408/g' ./*_Warp.conf
            ;;
        "2" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.2:2408/g' ./*_Warp.conf
            ;;
        "3" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.3:2408/g' ./*_Warp.conf
            ;;
        "4" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.4:2408/g' ./*_Warp.conf
            ;;
        "5" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.5:2408/g' ./*_Warp.conf
            ;;
        "6" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.6:2408/g' ./*_Warp.conf
            ;;
        "7" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.7:2408/g' ./*_Warp.conf
            ;;
        "8" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.8:2408/g' ./*_Warp.conf
            ;;
        "9" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.9:2408/g' ./*_Warp.conf
            ;;
        "10" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.1:500/g' ./*_Warp.conf
            ;;
        "11" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.2:500/g' ./*_Warp.conf
            ;;
        "12" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.3:500/g' ./*_Warp.conf
            ;;
        "13" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.4:500/g' ./*_Warp.conf
            ;;
        "14" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.5:500/g' ./*_Warp.conf
            ;;
        "15" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.6:500/g' ./*_Warp.conf
            ;;
        "16" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.7:500/g' ./*_Warp.conf
            ;;
        "17" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.8:500/g' ./*_Warp.conf
            ;;
        "18" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.9:500/g' ./*_Warp.conf
            ;;
        "19" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.1:1701/g' ./*_Warp.conf
            ;;
        "20" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.2:1701/g' ./*_Warp.conf
            ;;
        "21" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.3:1701/g' ./*_Warp.conf
            ;;
        "22" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.4:1701/g' ./*_Warp.conf
            ;;
        "23" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.5:1701/g' ./*_Warp.conf
            ;;
        "24" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.6:1701/g' ./*_Warp.conf
            ;;
        "25" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.7:1701/g' ./*_Warp.conf
            ;;
        "26" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.8:1701/g' ./*_Warp.conf
            ;;
        "27" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.9:1701/g' ./*_Warp.conf
            ;;
        "28" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.1:4500/g' ./*_Warp.conf
            ;;
        "29" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.2:4500/g' ./*_Warp.conf
            ;;
        "30" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.3:4500/g' ./*_Warp.conf
            ;;
        "31" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.4:4500/g' ./*_Warp.conf
            ;;
        "32" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.5:4500/g' ./*_Warp.conf
            ;;
        "33" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.6:4500/g' ./*_Warp.conf
            ;;
        "34" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.7:4500/g' ./*_Warp.conf
            ;;
        "35" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.8:4500/g' ./*_Warp.conf
            ;;
        "36" )
            sed -i 's/engage.cloudflareclient.com:2408/162.159.193.9:4500/g' ./*_Warp.conf
            ;;
    esac
}

if [[ $genwarpplus == "1" ]]; then
    echo ""
    if [[ -f ./invisibles-crack ]]; then
        while [[ $answer_user == * ]]; do
            sleep 5s
            clear -x
            ./invisibles-crack
            echo ""
            echo "Do you have Data transfer?"
            echo -e "Please \e[0;32menter any Keys\033[0m, will be regenerate new Warp+ license key:"
            echo "Enter 1 to abort the cycle."
            if [[ $SHELL == /bin/bash ]] || [[ $SHELL == /data/data/com.termux/files/usr/bin/bash ]]; then
                read answer_user;
            fi
            if [[ $SHELL == /bin/zsh ]] || [[ $SHELL == /data/data/com.termux/files/usr/bin/zsh ]]; then
                read answer_user;
            fi
            if [[ $answer_user == 1 ]]; then
                clear -x
                break
            fi
        done
    else
        echo -e "\e[0;31mPlease return file invisibles-crack current directory...\033[0m"
        echo -e "\e[0;31mCompletion of the script... Exit 1.\033[0m"
        exit 1
    fi
    echo -e "\e[0;32m=============================================================\033[0m"
    echo -e "\t\e[0;32mNew Warp+ license key above this line,\033[0m"
    echo -e "\t\e[0;32mcopy it and paste below\033[0m"
else
    if [[ $genwarpplus == "" ]]; then
        echo ""
        echo -e "\e[0;32mSkip generate Warp+ key\033[0m"
    fi
fi
echo -e "\e[0;32m=============================================================\033[0m"
read -p "Paste Warp+ license key or leave blank if you want to use new Warp:" warpkey
if [ ${#warpkey} -eq "0" ] || [ ${#warpkey} -ne "26" ] ; then #Разобраться
    echo -e "\e[0;34mEmpty or incorrect Warp+ key, trying use new Warp with random filenames\033[0m"
    echo ""
    echo -e "\e[0;34mRegister and create new Warp account...\033[0m"
    ./wgcf register --accept-tos --config ./${generate_random_string}_Warp.toml
    echo ""
    echo -e "\e[0;34mGenerate Warp config profile for WireGuard...\033[0m"
    ./wgcf generate -p ./${generate_random_string}_Warp.conf --config ./${generate_random_string}_Warp.toml
    #Edit
    echo ""
    echo -e "\e[0;34mEditing Lines to WireGuard config...\033[0m"
    #AllowedIPs edit
    sed -i '/::\/0/d' ./${generate_random_string}_Warp.conf && sed -i 's/AllowedIPs\ = 0.0.0.0\/0/AllowedIPs = 0.0.0.0\/0,::\/0/g' ./${generate_random_string}_Warp.conf
    #IPv6
    search_IPv6_address=$(grep -i \/128 ./${generate_random_string}_Warp.conf | awk '{print $3}')
    sed -i "s|/32|/32,${search_IPv6_address}|g" ./${generate_random_string}_Warp.conf
    sed -i '4d' ./${generate_random_string}_Warp.conf
    #Replace Domain->IP
    replace_ip;
    #DNS
    sed -i 's/1.1.1.1/1.0.0.1,1.1.1.1/g' ./${generate_random_string}_Warp.conf
    #PersistentKeepalive time adding in config
    echo PersistentKeepalive\ \= \25 >> ./${generate_random_string}_Warp.conf
    #Delete default 1280 MTU in config
    sed -i '5d' ./${generate_random_string}_Warp.conf
    echo -e "\e[0;34mDone!\033[0m"
else
    warpkey_short=$(echo $warpkey | awk '{ print substr( $0, 1, length($0)-18 ) }')
    echo -e "\e[0;34mTrying use Warp+ license key: ${warpkey}\033[0m"
    echo -e "\e[0;32m========== Select output filenames length ===========\033[0m"
    echo -e "\t\e[0;32m1. Full name include Warp key e.g. ${warpkey}_Warp.conf\033[0m"
    echo -e "\t\e[0;32m2. Short name include partial Warp key e.g. ${warpkey_short}_Warp.conf\033[0m"
    echo -e "\e[0;32m=====================================================\033[0m"
    echo ""
    read -p "Enter choice or press Enter to select 1: " choice
    if [[ $choice == 1 ]] || [[ $choice == "" ]]; then
        echo ""
        if [[ $choice == 1 ]]; then
            echo -e "\e[0;32mSelected full filenames\033[0m"
            echo ""
        fi
        if [[ $choice == "" ]]; then
            echo -e "\e[0;32mDefault selected full filenames\033[0m"
            echo ""
        fi
        echo -e "\e[0;34mRegister and create new Warp account...\033[0m"
        ./wgcf register --accept-tos --config ./${warpkey}_Warp.toml
        echo ""
        echo -e "\e[0;34mUpdate Warp+ on new license key...\033[0m"
        ./wgcf update --config ./${warpkey}_Warp.toml
        echo ""
        echo -e "\e[0;34mGenerate Warp+ config profile for WireGuard...\033[0m"
        ./wgcf generate -p ./${warpkey}_Warp.conf --config ./${warpkey}_Warp.toml
        echo ""
        #Edit
        echo ""
        echo -e "\e[0;34mEditing Lines to WireGuard config...\033[0m"
        #AllowedIPs edit
        sed -i '/::\/0/d' ./${warpkey}_Warp.conf && sed -i 's/AllowedIPs\ = 0.0.0.0\/0/AllowedIPs = 0.0.0.0\/0,::\/0/g' ./${warpkey}_Warp.conf
        #IPv6
        search_IPv6_address=$(grep -i \/128 ./${warpkey}_Warp.conf | awk '{print $3}')
        sed -i "s|/32|/32,${search_IPv6_address}|g" ./${warpkey}_Warp.conf
        sed -i '4d' ./${warpkey}_Warp.conf
        #Replace Domain->IP
        replace_ip;
        #DNS
        sed -i 's/1.1.1.1/1.0.0.1,1.1.1.1/g' ./${warpkey}_Warp.conf
        #PersistentKeepalive time adding in config
        echo PersistentKeepalive\ \= \25 >> ./${warpkey}_Warp.conf
        #Delete default 1280 MTU in config
        sed -i '5d' ./${warpkey}_Warp.conf
        echo -e "\e[0;34mDone!\033[0m"
    fi
    if [[ $choice == 2 ]]; then
        echo ""
        echo -e "\e[0;32mSelected short filenames\033[0m"
        echo ""
        echo -e "\e[0;34mRegister and create new Warp account...\033[0m"
        ./wgcf register --accept-tos --config ./${warpkey_short}_Warp.toml
        echo ""
        echo -e "\e[0;34mUpdate Warp+ on new license key...\033[0m"
        ./wgcf update --config ./${warpkey_short}_Warp.toml
        echo ""
        echo -e "\e[0;34mGenerate Warp+ config profile for WireGuard...\033[0m"
        ./wgcf generate -p ./${warpkey_short}_Warp.conf --config ./${warpkey_short}_Warp.toml
        echo ""
        #Edit
        echo ""
        echo -e "\e[0;34mEditing Lines to WireGuard config...\033[0m"
        #AllowedIPs edit
        sed -i '/::\/0/d' ./${warpkey_short}_Warp.conf && sed -i 's/AllowedIPs\ = 0.0.0.0\/0/AllowedIPs = 0.0.0.0\/0,::\/0/g' ./${warpkey_short}_Warp.conf
        #IPv6
        search_IPv6_address=$(grep -i \/128 ./${warpkey_short}_Warp.conf | awk '{print $3}')
        sed -i "s|/32|/32,${search_IPv6_address}|g" ./${warpkey_short}_Warp.conf
        sed -i '4d' ./${warpkey_short}_Warp.conf
        #Replace Domain->IP
        replace_ip;
        #DNS
        sed -i 's/1.1.1.1/1.0.0.1,1.1.1.1/g' ./${warpkey_short}_Warp.conf
        #PersistentKeepalive time adding in config
        echo PersistentKeepalive\ \= \25 >> ./${warpkey_short}_Warp.conf
        #Delete default 1280 MTU in config
        sed -i '5d' ./${warpkey_short}_Warp.conf
        echo -e "\e[0;34mDone!\033[0m"
    fi
fi
exit 0
