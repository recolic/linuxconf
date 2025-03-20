lc_assert_user_is root

lc_init () {
    # my favorite pkgs
    pacman -Sy --noconfirm fish dhcpcd vim sudo openssh
    pacman -Sy --noconfirm --asdeps openssl

    # add primary user
    useradd --create-home --shell /usr/bin/fish rtest
    echo 'rtest ALL=(ALL) NOPASSWD: ALL' | EDITOR='tee -a' visudo
    usermod --password $(echo testpass | openssl passwd -1 -stdin) rtest

    sudo -u rtest linuxconf register masterconf.sh

    # more desktop pkgs
    pacman -Sy --noconfirm gnome networkmanager power-profiles-daemon nextcloud-client firefox
    systemctl enable gdm NetworkManager power-profiles-daemon
}

