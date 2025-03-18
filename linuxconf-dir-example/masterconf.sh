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
lc_is_root && exit
lc_is_root || exit

function lc_init () {
    # as root / as user?

}

function lc_startup () {
    # as root / as user?
    # with desktop env?
    
}

function lc_login () {
    # warning: less useful. happens again if user logout/login again.
    lc_login_is_x11?
}

function lc_cron () {
    # hourly / daily / weekly / monthly?
    # as root / as user?
    
}

# map for every user? 
lc_fsmap files/vimrc $LC_USER_HOME/.vimrc

