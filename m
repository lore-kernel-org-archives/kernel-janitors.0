From: Ira Snyder <devel@irasnyder.com>
Date: Sun, 19 Nov 2006 08:47:28 +0000
Subject: [KJ] TODO list has already-completed items
Message-Id: <20061119004728.3e2a131f.devel@irasnyder.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0939802528=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============0939802528==
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Sun__19_Nov_2006_00_47_29_-0800_QN+Rby.vpIP1OYp7"

--Signature=_Sun__19_Nov_2006_00_47_29_-0800_QN+Rby.vpIP1OYp7
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Hello all,

I'm trying to get started doing some kernel hacking. While going through the TODO list on http://kernelnewbies.org I found that some of the things on the list have already been completed. So, in addition to notifying the list of things that can be removed from the TODO list, I'm looking for suggestions of something fairly easy I can help with.

Things I found to be completed:
1) Todo/ApiChanges: call SET_MODULE_OWNER or use .owner = THIS_MODULE instead of using MOD_{INC,DEC}_USE_COUNT

This one is pretty obvious. A quick "git-grep -e 'MOD_\(INC\|DEC\)_USE_COUNT'" shows that the only references to these symbols remaining are in comments.

2) Todo/ApiChanges: get rid of MODULE_PARM

Cscope will tell you that it is completely gone, except for in gdth.c (#defined out in recent kernels) and ibmmca.c (in comments).

I could make a patch to remove these completely, if it would help.

3) Todo/ApiChanges: get rid of (un)register_ioctl32_conversion()

Only two files have this in them (drivers/video/sis/sis_main.c and drivers/usb/misc/sisusbvga/sisusb.c). All ways of actually including them in a recent kernel are gone. (sis_main.c must be <=2.6.10 and the #define condition keeping these away in sisusb.c doesn't show up in the sources)

These are mostly done. Any opinions on if these would be ok-ish for a relative beginner?
1) Todo/ApiChanges: get rid of check_region(), use request_region().

There are only a few uses left. I could probably go through BusLogic.c and the others, and fix them up, but I have no such hardware to test with.

2) I found the -kj patchset, which hasn't been updated since 2.6.17-rc1. Considering 2.6.19 is almost done, this seems a little out of date. I tried applying the patch, but it looks like some parts have been merged. In any case, there are some conflicts.

Would it be worthwhile to fix the rejects and re-diff the patch?



Any other suggestions for something (relatively) easy to get into? I don't really care if it's tedious, that's ok :)

Ira

--
Ira Walter Snyder
WEB:    http://www.irasnyder.com/
AIM:    ClamChwdrMan
JABBER: ira.snyder@jabber.unoc.net
PGP:    http://www.irasnyder.com/pgp_pub_key.txt

--Signature=_Sun__19_Nov_2006_00_47_29_-0800_QN+Rby.vpIP1OYp7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFFYBokqvO4Mr6SCJURAqI2AJ923sah319fL9cXarFe9zpxlL9HdwCgyuBj
wGtlBHTh9PHtmQ2vMQEhcM4=
=i8py
-----END PGP SIGNATURE-----

--Signature=_Sun__19_Nov_2006_00_47_29_-0800_QN+Rby.vpIP1OYp7--

--===============0939802528==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0939802528==--
