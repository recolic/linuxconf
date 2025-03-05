# linux-sync

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