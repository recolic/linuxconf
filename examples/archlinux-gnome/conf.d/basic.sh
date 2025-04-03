lc_assert_user_is root

desktop_related_setup () {
    # to install & enable gnome
    pacman -Sy --noconfirm gnome networkmanager power-profiles-daemon
    systemctl enable gdm NetworkManager power-profiles-daemon

    # more customization...
    pacman -Sy --needed --noconfirm base-devel telegram-desktop docker shadowsocks-rust v2ray proxychains xclip adobe-source-han-sans-cn-fonts      pcsclite ccid    git inetutils wget ttf-fira-code htop tmux dos2unix nfs-utils fcitx5-im firefox
    pacman -Sy --needed --noconfirm recolic-aur/gnome-terminal-transparency recolic-aur/oreo-cursors-git
    
    echo '
# This file is parsed by pam_env module
# Syntax: simple KEY=VAL pairs on separate lines
GTK_IM_MODULE=fcitx5
QT_IM_MODULE=fcitx5
XMODIFIERS=@im=fcitx5' > /etc/environment
    
    systemctl enable bluetooth pcscd.service
}

lc_init () {
    # my favorite pkgs
    pacman -Syu --noconfirm
    pacman -S --noconfirm fish dhcpcd vim sudo openssh
    pacman -S --noconfirm --asdeps openssl

    # add primary user. If you want to do this, at least give read access to linuxconf dir.
    useradd --create-home --shell /usr/bin/fish rtest
    echo 'rtest ALL=(ALL) NOPASSWD: ALL' | EDITOR='tee -a' visudo
    usermod --password $(echo testpass | openssl passwd -1 -stdin) rtest

    if ! sudo -u rtest realpath masterconf.sh; then
        echo "ERROR: rtest do not have read access to current dir... fix permission and manually register with 'sudo -u rtest'."
    else
        sudo -u rtest linuxconf register masterconf.sh
    fi

    # more one-time customization
    grep kernel.sysrq=1 /etc/sysctl.d/99-sysctl.conf || echo 'kernel.sysrq=1' >> /etc/sysctl.d/99-sysctl.conf

    grep recolic-aur /etc/pacman.conf || echo '[recolic-aur]
    SigLevel = Optional TrustAll
    Server = https://drive.recolic.cc/mirrors/recolic-aur' >> /etc/pacman.conf
    sed -i 's/^[# ]*ParallelDownloads =[ 0-9A-Za-z]*$/ParallelDownloads = 5/g' /etc/pacman.conf
    sed -i 's/^[# ]*SystemMaxUse=[ 0-9A-Za-z]*$/SystemMaxUse=150M/g' /etc/systemd/journald.conf
    sed -i 's/^[# ]*SystemMaxFileSize=[ 0-9A-Za-z]*$/SystemMaxFileSize=30M/g' /etc/systemd/journald.conf

    desktop_related_setup
}

