FROM ubuntu:20.04
MAINTAINER codercaizh <545347837@qq.com>
EXPOSE 22
ENV DEBIAN_FRONTEND=noninteractive
# RUN sed -i "s@http://.*archive.ubuntu.com@http://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list && sed -i "s@http://.*security.ubuntu.com@http://mirrors.tuna.tsinghua.edu.cn@g" /etc/apt/sources.list
# openwrt固件编译依赖
RUN apt-get update && apt-get install -y fdisk btrfs-progs parted ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential zip2 ccache clang clangd cmake cpio curl device-tree-compiler ecj fastjar flex gawk gettext gcc-multilib g++-multilib git gperf haveged help2man intltool lib32gcc-s1 libc6-dev-i386 libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev libmpc-dev libmpfr-dev libncurses5-dev libncursesw5 libncursesw5-dev libreadline-dev libssl-dev libtool lld lldb lrzsz mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pip python3-ply python-docutils qemu-utils re2c rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev && apt-get autoremove --purge && apt-get clean 
ENV FORCE_UNSAFE_CONFIGURE=1
COPY ./scripts /opt/scripts
ENTRYPOINT ["/bin/bash", "/opt/scripts/build_with_docker.sh"]
