# we run this master config only once, for each "registered" user.
# To use linuxconf:
#   sudo linuxconf register path/to/masterconf.sh
#   sudo -u ... linuxconf register path/to/masterconf.sh
# Common use:
# 1. install fresh archlinux
# 2. download this directory from somewhere
# 3. ./linuxconf.wrapper register ./masterconf.sh
#      > linuxconf would be downloaded & installed automatically. lc_init() will happen right now.

# order by filename
lc_include conf.d/*

# If you have multiple user but this file is for a specific user...
lc_assert_user_is root
# lc_assert_user_is_not root

# I strongly suggest u design lc_init() as an idempotent operation. Just in case u accidentally run `linuxconf register` elsewhere.
lc_init () {
    # Some helpful functions.. To stop running current script:
    [ -f /usr/bin/apt ] || lc_die "This is not even ubuntu. Stop!"
    # To print an error message:
    apt install some_package || lc_err "Failed to install my favorite pkg!"
}

lc_startup () {
    sysctl kernel.sysrq=1

    # want some daemon in background? Note: linuxconf dir is always your workdir.
    lc_bgrun /tmp/server.log my_server --arg1 123 --arg2 "hello world !"
    # want it auto_restart?
    lc_bgrun /dev/null auto_restart important_service --config files/test.conf
    # want some timely task?
    lc_bgrun /dev/null every 1h curl https://example-ddns.com/api
}

lc_login () {
    # Your desktop environment must implement "XDG autostart". Ref: https://wiki.archlinux.org/title/XDG_Autostart
    #
    # Warning: Could be called multiple times if user logout/login again.
    # Desktop environment available.
    echo pass | gnome_keyring_unlock
}

# watch out! does your user have access to target directory?
# lc_fsmap works inside lc_xxx() or outside, also works even if files/vimrc doesn't exist yet.
lc_fsmap files/vimrc $HOME/.vimrc

