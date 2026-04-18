# Chalkboard Installer

Public installer for Chalkboard RC1.

This repository contains only the public installer bootstrap and packaged RC1 release artifact. The main development repository remains private.

## Fresh Raspberry Pi Install

Start with a freshly installed Raspberry Pi OS system.

Requirements:

- Raspberry Pi user is named `pi`
- SSH or local terminal access works
- Pi has internet access

Log into the Pi as `pi` and run:

```bash
curl -fsSL https://raw.githubusercontent.com/silentg33k/chalkboard-installer/main/install.sh | bash
```

The installer will:

- install download prerequisites
- download the Chalkboard RC1 package
- stage files under `/home/pi/chalkboard-upload`
- run the full Pi-side installer
- install packages and system configuration
- deploy Chalkboard to `/var/www/html/chalkboard`
- configure nginx, PHP-FPM, Chromium kiosk mode, cron, sudoers, permissions, and helpers
- reboot once at the end

## After Reboot

Try:

```text
https://chalkboard.local/
https://chalkboard.local/admin
https://chalkboard.local/settings
```

If `chalkboard.local` does not resolve, use the Pi IP:

```text
https://<PI_IP>/chalkboard/
https://<PI_IP>/admin
https://<PI_IP>/settings
```

A browser certificate warning is expected because Chalkboard uses a local self-signed certificate.

## Install Report

After reboot, SSH into the Pi and run:

```bash
less /home/pi/chalkboard-install-report.txt
chalkhealth
```

The root-owned install log is:

```bash
sudo less /var/log/chalkboard-install-report.txt
```

## Important

This RC1 installer expects the Pi user to be named `pi`.

Do not run the installer as root.
