lc_assert_user_is root

desktop_related_setup () {
    # to install & enable gnome
    pacman -Sy --noconfirm gnome networkmanager power-profiles-daemon nextcloud-client firefox
    systemctl enable gdm NetworkManager power-profiles-daemon

    # more customization...
    pacman -Sy --needed --noconfirm base-devel nextcloud-client firefox telegram-desktop docker shadowsocks-rust v2ray proxychains xclip adobe-source-han-sans-cn-fonts      pcsclite ccid    git inetutils wget ttf-fira-code htop tmux dos2unix nfs-utils python-pip gnome-tweaks fcitx5-im man-db man-pages  kolourpaint breeze
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
    pacman -Sy --noconfirm fish dhcpcd vim sudo openssh
    pacman -Sy --noconfirm --asdeps openssl

    # add primary user
    useradd --create-home --shell /usr/bin/fish rtest
    echo 'rtest ALL=(ALL) NOPASSWD: ALL' | EDITOR='tee -a' visudo
    usermod --password $(echo testpass | openssl passwd -1 -stdin) rtest

    sudo -u rtest linuxconf register masterconf.sh

    # more customization...
    grep kernel.sysrq=1 /etc/sysctl.d/99-sysctl.conf || echo 'kernel.sysrq=1' >> /etc/sysctl.d/99-sysctl.conf

    grep recolic-aur /etc/pacman.conf || echo '[recolic-aur]
    SigLevel = Optional TrustAll
    Server = https://drive.recolic.cc/mirrors/recolic-aur' >> /etc/pacman.conf
    sed -i 's/^[# ]*ParallelDownloads =[ 0-9A-Za-z]*$/ParallelDownloads = 5/g' /etc/pacman.conf
    sed -i 's/^[# ]*SystemMaxUse=[ 0-9A-Za-z]*$/SystemMaxUse=150M/g' /etc/systemd/journald.conf
    sed -i 's/^[# ]*SystemMaxFileSize=[ 0-9A-Za-z]*$/SystemMaxFileSize=30M/g' /etc/systemd/journald.conf

    desktop_related_setup
}

