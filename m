From: Tilman Schmidt <tilman@imap.cc>
Date: Sat, 18 Mar 2006 19:53:26 +0000
Subject: [KJ] [PATCH] usb.h: reduce syslog clutter
Message-Id: <441C6536.2060800@imap.cc>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33189104355970089=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============33189104355970089==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigB5AE833441ACE0576BB38099"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigB5AE833441ACE0576BB38099
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

The current versions of the err() / info() / warn() message macros in
include/linux/usb.h insert __FILE__ at the beginning of the message.
When those macros where introduced, back in 2.2 times, that expanded
to the name of the source file, which was fine.

However, with the build process changes in 2.5, __FILE__ now expands
to the complete path name of the source file within the kernel tree.
Consequently, that part of the kernel message now takes up about half
of an 80 character screen line.

The following patch modifies these macros so that, when used in a
module, they'll insert the module name instead, which is significantly
shorter and also tends to be more useful to users (as opposed to kernel
developers) trying to make sense of a particular message.

It also adds a macro for the "notice" message level which was missing
so far.

The triple checks for defined(CONFIG_MODULES), defined(THIS_MODULE)
and THIS_MODULE are necessary to catch all possible combinations of
- kernel being built with or without module support
- source file #including linux/usb.h or not
- source file actually being built as a module or not

Signed-off-by: Tilman Schmidt <tilman@imap.cc>
---

 usb.h |   14 +++++++++++---
 1 files changed, 11 insertions(+), 3 deletions(-)

--- linux-2.6.16-rc6/include/linux/usb.h        2006-02-27 06:09:35.000000000 +0100
+++ linux-2.6.16-rc6-patch-unclutter/include/linux/usb.h        2006-03-18 20:29:38.000000000 +0100
@@ -1199,12 +1199,20 @@
 #define dbg(format, arg...) do {} while (0)
 #endif

+#if defined(CONFIG_MODULES) && defined(THIS_MODULE)
+#define KMSG_LOCATION_PREFIX THIS_MODULE ? THIS_MODULE->name : __FILE__
+#else
+#define KMSG_LOCATION_PREFIX __FILE__
+#endif
+
 #define err(format, arg...) printk(KERN_ERR "%s: " format "\n" , \
-       __FILE__ , ## arg)
+       KMSG_LOCATION_PREFIX , ## arg)
 #define info(format, arg...) printk(KERN_INFO "%s: " format "\n" , \
-       __FILE__ , ## arg)
+       KMSG_LOCATION_PREFIX , ## arg)
 #define warn(format, arg...) printk(KERN_WARNING "%s: " format "\n" , \
-       __FILE__ , ## arg)
+       KMSG_LOCATION_PREFIX , ## arg)
+#define notice(format, arg...) printk(KERN_NOTICE "%s: " format "\n" , \
+       KMSG_LOCATION_PREFIX , ## arg)


 #endif  /* __KERNEL__ */

-- 
Tilman Schmidt                          E-Mail: tilman@imap.cc
Bonn, Germany
Help a man when he is in trouble and he will remember you when he is
in trouble again.



--------------enigB5AE833441ACE0576BB38099
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3rc1 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFEHGVGMdB4Whm86/kRAn3sAJ4n+Zglr3asnWZSx9t+UGBmjX+eaACeKIjk
fZv49uKu99cLUrxjoEYojWM=
=kF5S
-----END PGP SIGNATURE-----

--------------enigB5AE833441ACE0576BB38099--

--===============33189104355970089==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33189104355970089==--
