Nemunaire Gentoo Overlay
========================

This overlay includes ebuilds for the following packages:

* `net-im/netsoul-purple`: Netsoul plugin for libpurple (https://github.com/sekh/netsoul-purple)

Usage with Layman
-----------------

You can add this overlay using layman:

```
$ layman -f -a nemunaire -o https://raw.githubusercontent.com/nemunaire/gentoo-overlay/master/overlays.xml
```

Usage with Portage
------------------

```
mkdir /usr/local/portage
git clone git://github.com:nemunaire/gentoo-overlay.git /usr/local/portage
echo 'PORTDIR_OVERLAY="${PORTDIR_OVERLAY} /usr/local/portage/"' >> /etc/portage/make.conf
```
