FROM archlinux
ARG NDK_VERSION=r24
RUN pacman -Syyu --noconfirm && pacman -S base base-devel nano wget unzip go git bash bash-completion mc openssh --noconfirm -y && wget https://dl.google.com/android/repository/android-ndk-${NDK_VERSION}-linux.zip -P /opt/ && cd /opt && unzip ./android-ndk-${NDK_VERSION}-linux.zip && rm -f /opt/*.zip
ENV PATH /opt/android-ndk-${NDK_VERSION}/toolchains/llvm/prebuilt/linux-x86_64/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin