# linuxconf

> backup or sync all your linux customizations in one place.

Linux's flexibility is its greatest strength, yet the endless maze of scattered configurations and customizations turns setup into a tedious, error-prone process. Every new machine becomes a painful chore of piecing together dotfiles, scripts, and tweaks, making reproducibility a constant challenge. 

I'm trying to introduce a solution, basing on my experience. This is how I packed all customizations into a single directory, and have it synced with Nextcloud (and git).

The top challenge is to gather all customizations & put all of them into a single place. I know you have your own sync tool / backup solution. No worry, it's up to you to determine how u want to backup them!

## note

```
1. package list
2. customized executable (and additional files?)
3. init.sh (one time config task), startup.sh (on-boot task), cron.sh (timely task)
managed special directory.. such as .vim gnome-ext ...
systemd?
```

# linux centralized customization

1. what to do when open this new laptop (init)
2. what to do when PC boots up (startup)
3. what to do when user logged in (login)
4. what to do in background (cron)
5. what file to override (customer application, package, config file, script, ...) 

You might say, I use install-my-pkgs.sh for task-1, systemd for task-2 (probably multiple files everywhere), shell-rc for task-3 (probably with .profile), crontab for task-4 (probably with some systemd mess), dotfile for task-5.

Nice. You have just demonstrated how to reproduce that ugly mess: Various customization everywhere.

This project is to manage everything in a centralized folder. If you back it up & recover, your workspace is back. If you move this single folder to another PC, it turns into your familiar workspace.


## todo

another example for archlinux gnome, for demo

## dependency:

bash coreutils grep
