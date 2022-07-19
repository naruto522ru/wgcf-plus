#!/bin/bash
NDK_VERSION=r24
if [ $(command -v zip) ]; then
    rm -rfv ./wgcf-plus-realease
    cp -r ./Lin_32bit ./wgcf-plus-realease
    cd ./wgcf-plus-realease
    rm -fv ./main.go
    mv .pywarp.py pywarp.py
    #Linux 32bit
    zip -9 ./Linux-32bit.zip  pywarp.py invisibles-crack warp_config_generator.sh wgcf
    #Linux ARMv7
    cp -f ../Lin_armv7/{wgcf,invisibles-crack} ./
    zip -9 ./Linux-ARMv7.zip pywarp.py invisibles-crack warp_config_generator.sh wgcf
    #MacOS amd64
    cp -f ../MACOS_64bit/{wgcf,invisibles-crack} ./
    zip -9 ./MacOS-64bit.zip pywarp.py invisibles-crack warp_config_generator.sh wgcf
    #MacOS ARMv8
    cp -f ../MACOS_ARMv8/{wgcf,invisibles-crack} ./
    zip -9 ./MacOS-ARMv8.zip pywarp.py invisibles-crack warp_config_generator.sh wgcf
    #Termux ARMv7
    if [[ -d /opt/android-ndk-"$NDK_VERSION" ]]; then
    cp -f ../Termux_armv7/{wgcf,invisibles-crack} ./;
    zip -9 ./Termux-ARMv7.zip pywarp.py invisibles-crack warp_config_generator.sh wgcf;
    fi
    #Termux 32bit
    if [[ -d /opt/android-ndk-"$NDK_VERSION" ]]; then
    cp -f ../Termux_32bit/{wgcf,invisibles-crack} ./;
    zip -9 ./Termux-32bit.zip pywarp.py invisibles-crack warp_config_generator.sh wgcf;
    fi
    #WSL Windows only 64bit
    cp -f ../Win_WSL/{invisibles-crack.exe,wgcf.exe} ./;
    zip -9 ./WSL.zip pywarp.py invisibles-crack.exe warp_config_generator.sh wgcf.exe;
    #Windows 32bit
    rm -vf ./{wgcf,invisibles-crack,warp_config_generator.sh}
    cp -f ../Win_32bit/{invisibles-crack.exe,wgcf.exe,warp_config_generator.ps1} ./
    zip -9 ./Windows-32bit.zip pywarp.py invisibles-crack.exe warp_config_generator.ps1 wgcf.exe
    #Windows ARMv7
    cp -f ../Win_armV7/{invisibles-crack.exe,wgcf.exe} ./
    zip -9 ./Windows-ARNv7.zip pywarp.py invisibles-crack.exe warp_config_generator.ps1 wgcf.exe
    rm -rfv pywarp.py wgcf* warp_config_generator* invisibles-crack.exe
    clear -x;
    echo "Testing archive"
    zip -T ./Linux-32bit.zip
    zip -T ./MacOS-64bit.zip;
    zip -T ./Windows-ARNv7.zip;
    zip -T ./Linux-ARMv7.zip;
    zip -T ./MacOS-ARMv8.zip;
    zip -T ./Windows-32bit.zip;
if [[ -f ./Termux-ARMv7.zip ]]; then
    zip -T ./Termux-ARMv7.zip;
fi
if [[ -f ./Termux-32bit.zip ]]; then
        zip -T ./Termux-32bit.zip;
fi
    zip -T ././WSL.zip;
    echo "Clean binary in repository!"
    find ../ -type f -name "wgcf*" -delete;
    find ../ -type f -name "invisibles-crack*" -delete;
else
    echo "Install zip package!"
fi
exit 0
