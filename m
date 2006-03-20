From: Tilman Schmidt <tilman@imap.cc>
Date: Mon, 20 Mar 2006 19:44:40 +0000
Subject: [KJ] [PATCH] usb.h: reduce syslog clutter
Message-Id: <441F0628.3080202@imap.cc>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14384297778349575=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <441C6536.2060800@imap.cc>
In-Reply-To: <441C6536.2060800@imap.cc>
To: kernel-janitors@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--===============14384297778349575==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enig4C8EE72F4C43E61438F1C6FC"

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig4C8EE72F4C43E61438F1C6FC
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

Signed-off-by: Tilman Schmidt <tilman@imap.cc>
---

 usb.h |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

--- linux-2.6.16-rc6/include/linux/usb.h        2006-02-27 06:09:35.000000000 +0100
+++ linux-2.6.16-rc6-patch-unclutter/include/linux/usb.h        2006-03-20 20:31:21.000000000 +0100
@@ -1199,12 +1199,14 @@
 #define dbg(format, arg...) do {} while (0)
 #endif

-#define err(format, arg...) printk(KERN_ERR "%s: " format "\n" , \
-       __FILE__ , ## arg)
-#define info(format, arg...) printk(KERN_INFO "%s: " format "\n" , \
-       __FILE__ , ## arg)
-#define warn(format, arg...) printk(KERN_WARNING "%s: " format "\n" , \
-       __FILE__ , ## arg)
+#define err(format, arg...) printk(KERN_ERR KBUILD_MODNAME ": " \
+       format "\n" , ## arg)
+#define info(format, arg...) printk(KERN_INFO KBUILD_MODNAME ": " \
+       format "\n" , ## arg)
+#define warn(format, arg...) printk(KERN_WARNING KBUILD_MODNAME ": " \
+       format "\n" , ## arg)
+#define notice(format, arg...) printk(KERN_NOTICE KBUILD_MODNAME ": " \
+       format "\n" , ## arg)


 #endif  /* __KERNEL__ */

-- 
Tilman Schmidt                          E-Mail: tilman@imap.cc
Bonn, Germany




--------------enig4C8EE72F4C43E61438F1C6FC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3rc1 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFEHwYoMdB4Whm86/kRAjrmAJ9Xz6lVOm39lrH/RSWdqzHpAZxiRwCeLpyL
n765EBTyxP/+Ct0wJ56Cwhg=
=oTkK
-----END PGP SIGNATURE-----

--------------enig4C8EE72F4C43E61438F1C6FC--

--===============14384297778349575==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14384297778349575==--
