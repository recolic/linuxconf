# setup this linuxconf on fresh-installed archlinux

lc_include conf.d/*

lc_assert_user_is root

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

