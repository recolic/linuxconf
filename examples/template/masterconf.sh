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

lc_include conf.d/*

# likely to use the following grammar in each sub conf:
lc_assert_user_is root
lc_assert_user_is_not root

# I strongly suggest u design lc_init() as an idempotent operation. Just in case u accidentally run `linuxconf register` elsewhere.
function lc_init () {
    # as root / as user?

    # Some helpful functions.. To stop running current script:
    [ -f /usr/bin/apt ] || die "This is not even ubuntu. Stop!"
    # To print an error message:
    apt install some_package || err "Failed to install my favorite pkg!"

    gsettings set var=123
}

function lc_startup () {
    # as root / as user?
    # with desktop env? (not supported yet)
    
}

function lc_login () {
    # Your desktop environment must implement "XDG autostart". Ref: https://wiki.archlinux.org/title/XDG_Autostart
    # Otherwise... Use lc_init to your task into wherever u'd like.
    #
    # Warning: Could be called multiple times if user logout/login again.
    lc_login_is_x11?
}

function lc_cron () {
    # hourly / daily / weekly / monthly?
    # as root / as user?
    
}

# Warning: watch out for unintended user
lc_fsmap files/vimrc $LC_USER_HOME/.vimrc

lc_daemon files/myservice.sh

# TODO: what if lc_fsmap depends on lc_init() ?? This is not recommended usage. 
# e.g: 'git clone xxx $HOME/sh' and lc_fsmap $HOME/sh/something /usr/bin/fancy
# lc_fsmap should success even if $HOME/sh/something doesn't exist yet. (what if dest also not exist? let it fail...)

