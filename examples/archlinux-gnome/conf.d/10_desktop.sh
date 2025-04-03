lc_assert_user_is_not root

# okay to stay inside lc_init() or outside
lc_fsmap files/config.fish $HOME/.config/fish/config.fish
lc_fsmap files/ssh_config $HOME/.ssh/config
lc_fsmap files/vimrc $HOME/.vimrc

config_gsettings () {
    gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type nothing
    gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type nothing
    gsettings set org.gnome.settings-daemon.plugins.power idle-dim false
    gsettings set org.gnome.desktop.screensaver idle-activation-enabled false
    gsettings set org.gnome.desktop.privacy remember-recent-files false
    gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
    gsettings set org.gnome.desktop.interface enable-hot-corners false
    gsettings set org.gnome.desktop.media-handling automount false
    gsettings set org.gnome.desktop.media-handling automount-open false
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Shift><Alt>Left']"
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Shift><Alt>Right']"
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Shift><Alt>Up']"
    gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Shift><Alt>Down']"
    gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left "['<Super><Shift>Left']"
    gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right "['<Super><Shift>Right']"
    gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-up "['<Super><Shift>Up']"
    gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-down "['<Super><Shift>Down']"
    gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Primary>Tab']"
    gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Primary><Shift>Tab']"
    gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab', '<Alt>Tab']"
    gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab', '<Shift><Alt>Tab']"
}

lc_init () {
    [[ -d $HOME/sh ]] || git clone https://git.recolic.net/root/daily-scripts.git $HOME/sh || return 1

    # config_gpg
    config_gsettings
}

lc_startup () {
    firefox_config='
user_pref("browser.tabs.tabmanager.enabled", false);
user_pref("services.sync.prefs.sync.browser.uiCustomization.state", true);
user_pref("browser.tabs.hoverPreview.enabled", false);'
    for dir in "$HOME"/.mozilla/firefox/*.default*; do
        [[ -d "$dir" ]] && echo "$firefox_config" > "$dir/user.js"
    done

    lcf_bgrun /tmp/ddns.log auto_restart bash -c "curl https://recolic.net/tmp/example-ddns-api.log ; sleep 300"

    [[ -f /usr/bin/az ]] && az config set core.login_experience_v2=off || true
}

lc_login () {
    # echo _:1 | bash /usr/mybin/unlock_keyrings
    echo "$(date) test-only: lc_login called" >> /tmp/note
    chmod 777 /tmp/note
    lcf_echo2 "detected login as $(whoami). it's running as expected!"
}

