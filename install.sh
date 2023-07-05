#!/bin/bash

echo "-- Welcome to neovim configuration script."
echo "-- Make sure you have fast Github connection for best experience."


# ./install.sh nvim, for using neovim
# ./install.sh vim y, for not asking from terminal


VIMEXE=${1}
FORCE=${2}
NVIM_VERSION="0.8.0"
CONFIGURATION_PATH="~/.config/test_nvim"
GIT_VERSION="2.26"

if [ "x$UID" == "x0" ] || [ "x$FORCE" == "xy" ];then
    echo -n "-- This script doesn't need manually add sudo, if you run as root, it will install for root user instead, sure to continue(Y/N)?"
    read -n1 x
    echo
    if [ "x$x" == "xn" ];then exit 1; fi
fi


if [ "x$VIMEXE" == "x" ]; then
    if which nvim 2> /dev/null; then VIMEXE=vim
    elif which nvim 2> /dev/null; then VIMEXE=nvim
    else 
        echo 'Error: Cannot find vim or nvim executable!'
        echo 'Error: Please install vim first: apt install vim'
        exit 1
    fi
fi

echo "-- Installing for executable: $VIMEXE"
echo "-- Installing for user: $USER ($UID)"

get_linux_distro(){
    if grep -Eq "Ubuntu" /etc/*-release 2> /dev/null; then
        echo "Ubuntu"
    elif grep -Eq "Deepin" /etc/*-release 2> /dev/null; then
        echo "Deepin"
    elif grep -Eq "LinuxMint" /etc/*-release 2> /dev/null; then
        echo "LinuxMint"
    elif grep -Eq "CentOs" /etc/*-release 2> /dev/null; then
        echo "CentOs"
    elif grep -Eq "Arch Linux" /etc/*-release 2> /dev/null; then
        echo "Arch Linux"
    elif grep -Eq "ManjaroLinux" /etc/*-release 2> /dev/null; then
        echo "Manjaro Linux"
    else echo "Unknown"
    fi
}

detect_platform(){
    local platform="$(uname -s | tr '[:upper:]' '[:lower:]')"

    # check for musl
    if [ "$platform" = "linux" ]; then
        if ldd /bin/sh | grep -i musl > /dev/null; then
            platform=linux_musl
        fi
    fi

    # mingw is git-bash
    if echo "$platform" | grep -i mingw > /dev/null; then
        platform=win
    fi
    echo "$platform"
}

detect_arch(){
    local arch="$(uname -m | tr '[:upper:]' '[:lower:]')"
    if echo "$arch" | grep -i arm > /dev/null; then
        # arm is fine
        echo "$arch"
    else
        if [ "$arch" = "i386" ];then
            arch=x86
        elif [ "$arch" = "x86_64" ]; then
            arch=x86_64
        elif [ "$arch" = "aarch64" ]; then
            arch=arm64
        fi

        # `uname -s ` in some cases miss-report 32-bit OS as 64 bit, so double check
        if [ "${arch}" = "x64" ] && [ "$(getconf LONG_BIT)" -eq 32 ]; then
            arch=x86
        fi
        echo "$arch"
    fi
}

check_neovim_version(){
    #check the version of neovim
    array="$(nvim --version)"
    version=${array:6:6}

    if [ "$version" \< "$NVIM_VERSION" ];then
        echo "-- The version of Neovim should be greater than 0.5.0 instead of ${version}."
        exit 1
    else
        echo "-- Neovim attaches the requirements."
    fi

}

install_packer(){
    check_neovim_version

    packer_path="~/.local/share/nvim/packer.nvim"

bash <<EOF
    set -e 
    if [ -e $packer_path ];then
        echo "-- packer.nvim has already existed."
        exit 0
    else
        git clone --depth 1 https://github.com/wbthomason/packer.nvim\
            $packer_path
    fi
EOF

}

install_nerd_font(){
    #check git version
    git_version="$(git --version)"
    version="${git_version:12:6}"
    if [ "$version" \< "$GIT_VERSION" ];then
        echo "Git's version should be greater than 2.26 instead of $version"
        exit 1
    fi

    if $(git clone --depth 1 --filter=blob:none --sparse git@github.com:ryanoasis/nerd-fonts tmp/nerd-fonts);then
        cd tmp/nerd-fonts
        git sparse-checkout add patched-fonts/JetBrainsMono
        cd -
        echo "-- Install Nerd Font : JetBrainsMono"
    else
        echo "-- Nerd Font installed fail."
    fi
}
apt_install_prior_requirements(){
    sudo apt update

    # Git Curl wget unzip tar gzip
    for x in git curl wget unzip tar gzip;do
        if which $x 1> /dev/null; then
           echo "-- $x has already been installed." 
       else
            sudo apt install $x
        fi
    done
    
    # nodejs npm
    sudo apt install nodejs npm
    echo "-- Nodejs installed successfully! Nodejs Version: $(nodejs --version)."
    # nerd fonts for devicon font and nvim-tree
    install_nerd_font 

    # ascii-image-converter for image.nvim
    if which ascii-image-converter 1> /dev/null;then
        echo "-- ascii-image-converter has already been installed."
    else
        sudo wget -P tmp/image-converter https://github.com/TheZoraiz/ascii-image-converter/releases/download/v1.13.1/ascii-image-converter_Linux_amd64_64bit.tar.gz
        cd tmp/image-converter
        tar -xvf ascii-image-converter_Linux_amd64_64bit.tar.gz
        sudo mv ascii-image-converter /usr/bin/
        cd -
    fi
    

}

manjaro_install_prior_requirements(){
    sudo pacman -Syu 

    # Git Curl wget unzip tar gzip
    for x in git curl wget unzip tar gzip;do
        if which $x 1> /dev/null; then
           echo "-- $x has already been installed." 
       else
            sudo pacman -S install $x
        fi
    done
    
    # nodejs npm
    sudo pacman -S nodejs npm
    echo "-- Nodejs installed successfully! Nodejs Version: $(nodejs --version)."
    # nerd fonts for devicon font and nvim-tree
    install_nerd_font 

    # ascii-image-converter for image.nvim
    if which ascii-image-converter 1> /dev/null;then
        echo "-- ascii-image-converter has already been installed."
    else
        sudo wget -P tmp/image-converter https://github.com/TheZoraiz/ascii-image-converter/releases/download/v1.13.1/ascii-image-converter_Linux_amd64_64bit.tar.gz
        cd tmp/image-converter
        tar -xvf ascii-image-converter_Linux_amd64_64bit.tar.gz
        sudo mv ascii-image-converter /usr/bin/
        cd -
    fi
    
}

install_prior_requirements(){
    # install nodejs
    local distro=$(get_linux_distro)
    case $distro in
        "Ubuntu")
            apt_install_prior_requirements
            ;;
        "Manjaro")
            manjaro_install_prior_requirements
            ;;
    esac

}

copy_nvim_configurations(){
bash<<EOF
    if [ -d ${CONFIGURATION_PATH} ]; then
        echo "-- ${CONFIGURATION_PATH} has already existed."
        exit 0
    else
        cd ~
        mkdir  -p ${CONFIGURATION_PATH}
        cd -
        cp -r ${PWD}/* ${CONFIGURATION_PATH}
    fi
EOF
}

install_any(){
    detect_platform
    get_linux_distro
    detect_arch
    copy_nvim_configurations
    install_prior_requirements
    install_packer
}



install_any

rm -rf tmp
