Nemunaire Gentoo Overlay
========================

This overlay includes ebuilds for the following packages:

* FIXME

Usage with Layman
-----------------

```
$ wget "https://raw.githubusercontent.com/nemunaire/gentoo-overlay/master/overlays.xml" -O /etc/layman/overlays/nemunaire.xml
$ layman -f -a odroidc1
```

Usage with Portage
------------------

```
mkdir /usr/local/portage
git clone git://github.com:nemunaire/gentoo-overlay.git /usr/local/portage
echo 'PORTDIR_OVERLAY="${PORTDIR_OVERLAY} /usr/local/portage/"' >> /etc/portage/make.conf
```
