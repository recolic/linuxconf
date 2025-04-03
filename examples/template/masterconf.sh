# we run this master config only once, for each "registered" user.
# To use linuxconf:
#   sudo linuxconf register ()
#   linuxconf register ()
# Common use:
# 1. install archlinux fresh
# 2. copy this linuxconf dir, please it somewhere. (put a linuxconf wrapper script in this dir? automatically install linuxconf from githubi (pkg manager if available) if not installed, then run real linuxconf.)
# 3. ./linuxconf register .
#      > check if linuxconf installed, install it if not.
#      > create / overwrite config file in /etc/linuxconf.conf, just 1 line: `root=/path/to/...`
#            don't touch it if already have correct content, report error if need update & no permission
#      > conf.d/basic.sh should install pkgs, (possibly) create new user, (possibly) run `linuxconf register .` again with new user.
#

# order by filename
lc_include conf.d/*

# If you have multiple user.. You might need this in your config file.
lc_assert_user_is root
lc_assert_user_is_not root

# I strongly suggest u design lc_init() as an idempotent operation. Just in case u accidentally run `linuxconf register` elsewhere.
lc_init () {
    # as root / as user?

    # Some helpful functions.. To stop running current script:
    [ -f /usr/bin/apt ] || die "This is not even ubuntu. Stop!"
    # To print an error message:
    apt install some_package || err "Failed to install my favorite pkg!"

    gsettings set var=123
}

lc_startup () {
    # as root / as user?
    # You want desktop env? Use lc_login()
    
    # want some daemon in background?
    lcf_bgrun /tmp/server.log my_server --arg1 123 --arg2 "hello world !"
    # Guaranteed! linuxconf dir is your current workdir.
    lcf_bgrun /dev/null auto_restart important_service --config files/test.conf
}

lc_login () {
    # Your desktop environment must implement "XDG autostart". Ref: https://wiki.archlinux.org/title/XDG_Autostart
    # Otherwise... Use lc_init to your task into wherever u'd like.
    #
    # Warning: Could be called multiple times if user logout/login again.
}

# watch out! does your user have access to target directory?
# okay to stay inside lc_init() or outside, okay if files/vimrc doesn't exist yet.
lc_fsmap files/vimrc $HOME/.vimrc

