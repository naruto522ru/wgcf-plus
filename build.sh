#!/bin/bash
NDK_VERSION=r24
rm -rvf ./build-invisibles-crack
cp -r ./Lin_32bit ./build-invisibles-crack
cd ./build-invisibles-crack
rm -rfv ./{warp_config_generator.sh,wgcf}
if [ $(command -v go) ]; then
    go mod init invisibles-crack
    go mod tidy
    #Linux ARMv7
    GOOS=linux GOARCH=arm go build -o ./invisibles-crack
    cp -f ./invisibles-crack ../Lin_armv7/
    #Linux 32bit
    GOOS=linux GOARCH=386 go build -o ./invisibles-crack
    cp -f ./invisibles-crack ../Lin_32bit/
    #Windows WSL
    mv ./invisibles-crack ../Win_WSL/
    #macOS 64bit
    GOOS=darwin GOARCH=amd64 go build -o ./invisibles-crack
    mv ./invisibles-crack ../MACOS_64bit/
    #macOS ARMv8
    GOOS=darwin GOARCH=arm64 go build -o ./invisibles-crack
    mv ./invisibles-crack ../MACOS_ARMv8/
    #Windows 32bit
    GOOS=windows GOARCH=386 go build -o ./invisibles-crack
    mv ./invisibles-crack ../Win_32bit/invisibles-crack.exe
    #Windows ARMv7
    GOOS=windows GOARCH=arm go build -o ./invisibles-crack
    mv ./invisibles-crack ../Win_armV7/invisibles-crack.exe
    if [ -d /opt/android-ndk-"$NDK_VERSION" ]; then
        #Termux ARMv7
        CGO_ENABLED=1 GOOS=android GOARCH=arm CC=armv7a-linux-androideabi30-clang go build -o ./invisibles-crack
        mv ./invisibles-crack ../Termux_armv7/
        #Termux x86
        CGO_ENABLED=1 GOOS=android GOARCH=386 CC=i686-linux-android30-clang go build -o ./invisibles-crack
        mv ./invisibles-crack ../Termux_32bit/
    fi
    if [ $(command -v git) ]; then
        git clone https://github.com/ViRb3/wgcf.git
        cd wgcf
        #Linux ARMv7
        GOOS=linux GOARCH=arm go build
        cp -f ./wgcf ../../Lin_armv7/
        #Linux 32bit
        GOOS=linux GOARCH=386 go build
        cp -f ./wgcf ../../Lin_32bit/
        #Windows WSL
        mv ./wgcf ../../Win_WSL/
        #macOS 64bit
        GOOS=darwin GOARCH=amd64 go build
        mv ./wgcf ../../MACOS_64bit/
        #macOS ARMv8
        GOOS=darwin GOARCH=arm64 go build
        mv ./wgcf ../../MACOS_ARMv8/
        #Windows 32bit
        GOOS=windows GOARCH=386 go build -o ./wgcf.exe
        mv ./wgcf.exe ../../Win_32bit/wgcf.exe
        #Windows ARMv7
        GOOS=windows GOARCH=arm go build -o ./wgcf.exe
        mv ./wgcf.exe ../../Win_armV7/wgcf.exe
        if [ -d /opt/android-ndk-"$NDK_VERSION" ]; then
            #Termux ARMv7
            CGO_ENABLED=1 GOOS=android GOARCH=arm CC=armv7a-linux-androideabi30-clang go build
            mv ./wgcf ../../Termux_armv7/
            #Termux x86
            CGO_ENABLED=1 GOOS=android GOARCH=386 CC=i686-linux-android30-clang go build
            mv ./wgcf ../../Termux_32bit/
        fi
        cd ..
    fi
    cd .. && rm -rfv ./build-invisibles-crack/
else
    echo "Install Golang package!"
fi
exit 0