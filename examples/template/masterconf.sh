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

    # note: in demo, append /etc/profile for PATH
}

function lc_startup () {
    # as root / as user?
    # with desktop env? (not supported yet)
    
}

function lc_login () {
    # warning: less useful. happens again if user logout/login again.
    # (no plan to support in first ver)
    lc_login_is_x11?
}

function lc_cron () {
    # hourly / daily / weekly / monthly?
    # as root / as user?
    
}

# Warning: watch out for unintended user
lc_fsmap files/vimrc $LC_USER_HOME/.vimrc

