#!/bin/bash
clear -x;
echo -e "\e[0;32m================ Generate Warp+ license key? ================\033[0m"
echo -e "\t\e[0;32mEnter 1, will be generate new Warp+ license key.\033[0m"
echo -e "\t\e[0;32mPress Enter without entry to skip generate.\033[0m"
echo -e "\e[0;32m=============================================================\033[0m"
echo ""
read -p "Enter 1 to generate or press Enter to skip:" genwarpplus
generate_random_string=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
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
    sed -i 's/engage.cloudflareclient.com:2408/162.159.193.5:2408/g' ./${generate_random_string}_Warp.conf
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
        sed -i 's/engage.cloudflareclient.com:2408/162.159.193.5:2408/g' ./${warpkey}_Warp.conf
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
        sed -i 's/engage.cloudflareclient.com:2408/162.159.193.5:2408/g' ./${warpkey_short}_Warp.conf
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
