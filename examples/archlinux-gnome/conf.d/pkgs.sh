lc_assert_user_is root

lc_init () {
    # my favorite package
    pacman -Sy --noconfirm fish dhcpcd vim sudo openssh
    pacman -Sy --noconfirm --asdeps openssl

    pacman -Sy --noconfirm gnome networkmanager power-profiles-daemon nextcloud-client firefox

    # add primary user
    useradd --create-home --shell /usr/bin/fish rtest
    echo 'rtest ALL=(ALL) NOPASSWD: ALL' | EDITOR='tee -a' visudo
    usermod --password $(echo testpass | openssl passwd -1 -stdin) rtest

    systemctl enable gdm NetworkManager power-profiles-daemon
}

