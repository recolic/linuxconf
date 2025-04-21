# linuxconf: Centralized customization

> All customizations in one place. Easier for sync / backup, easier to ramp up new machine.

## linux centralized customization

1. what to do when open this new laptop (init)
2. what to do when PC boots up (startup)
3. what to do when user logged in (login)
4. what to do in background (cron)
5. what file to override (customer application, package, config file, script, ...) 

You might say, I use install-my-pkgs.sh for task-1, systemd for task-2 (probably multiple files everywhere), shell-rc for task-3 (probably with .profile), crontab for task-4 (probably with some systemd mess), dotfile for task-5.

Nice. You have just demonstrated how to reproduce that ugly mess: Everything is everywhere.

This project is to demonstrate a possibility to manage customization in a centralized folder. If you back it up & recover, your workspace is back. If you move this single folder to another PC, it turns into your familiar workspace.

## dependency

coreutils bash grep sudo

## examples

|Example|Note|
|---|---|
|[template](template)|Complete documented empty config|
|[archlinux-gnome](archlinux-gnome)|An example multi-user config with archlinux and gnome|

<!--
|[ubuntu-server](ubuntu-server)|An example root-user config for ubuntu server|
|[non-root](non-root)|An example config for machine without root access|
-->

- Real-world example

linuxconf for all recolic's devices, including desktop/laptop/server/devbox:  
<https://git.recolic.net/root/daily-scripts/-/tree/master/linuxconf?ref_type=heads>

