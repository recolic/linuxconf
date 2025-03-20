lc_assert_user_is_not root

lc_init () {
    [[ -d $HOME/sh ]] || git clone https://git.recolic.net/root/daily-scripts.git $HOME/sh || return 1

}

lc_startup () {

}

