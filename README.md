# Chalkboard — Self-Hosted Raspberry Pi Wall Display

**A local-only kiosk display that installs in under 10 minutes and runs with no cloud, no account, and no subscription.**

---

## What this is

Chalkboard turns a Raspberry Pi into a wall-mounted dashboard that:

- boots directly into a fullscreen display
- runs entirely on your local network
- is controlled from a browser
- stores all data locally

> No cloud services. No vendor lock-in.

---

## Install (fresh Pi running system)

Start with a fresh Raspberry Pi OS install.

### Requirements

- User is named pi
- SSH or local terminal access
- Internet connection

Run:

```
curl -fsSL https://raw.githubusercontent.com/silentg33k/chalkboard-installer/main/install.sh | bash
```

That’s it.

The system will install, configure itself, and reboot once.

**Typical install time: ~8 minutes from command to running display**

---

## What the installer does

- installs required packages
- downloads the Chalkboard RC1 release
- stages files under /home/pi/chalkboard-upload
- deploys to /var/www/html/chalkboard
- configures:
    - nginx
    - PHP-FPM
    - Chromium kiosk mode
    - X11 / Openbox
    - cron jobs
    - sudoers + permissions
- performs a full system setup
- reboots automatically

---

## After reboot

Open from another device:

```
https://chalkboard.local/
https://chalkboard.local/admin
https://chalkboard.local/settings
```

If .local doesn’t resolve:

```
https://<PI_IP>/chalkboard/
https://<PI_IP>/admin
https://<PI_IP>/settings
```

A certificate warning is expected (self-signed HTTPS).

---

## System behavior

- display runs immediately after boot
- admin interface is available on the network
- additional features (weather, calendar, etc.) can be configured later

> The system is usable before any configuration.

---

## Install report

After install:

```
less /home/pi/chalkboard-install-report.txt
chalkhealth
```

Root log:

```
sudo less /var/log/chalkboard-install-report.txt
```

---

## Important

- User must be named pi
- Do not run installer as root
