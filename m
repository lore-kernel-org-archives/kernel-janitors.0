From: Stefan Sperling <stefan@binarchy.net>
Date: Tue, 09 Nov 2004 21:34:42 +0000
Subject: [KJ] [PATCH] convert orinoco wireless driver to module_param
Message-Id: <20041109213442.GF9496@dice.seeling33.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23601616371053735=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============23601616371053735==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Replaces MODULE_PARM with module_param calls in orinoco wireless driver.

--- drivers/net/wireless/orinoco.c.orig	2004-11-09 20:40:22.009921296 +0100
+++ drivers/net/wireless/orinoco.c	2004-11-08 21:01:00.000000000 +0100
@@ -461,12 +461,12 @@ MODULE_LICENSE("Dual MPL/GPL");
 /* Level of debugging. Used in the macros in orinoco.h */
 #ifdef ORINOCO_DEBUG
 int orinoco_debug = ORINOCO_DEBUG;
-MODULE_PARM(orinoco_debug, "i");
+module_param(orinoco_debug, int, 0644);
 EXPORT_SYMBOL(orinoco_debug);
 #endif
 
 static int suppress_linkstatus; /* = 0 */
-MODULE_PARM(suppress_linkstatus, "i");
+module_param(suppress_linkstatus, bool, 0644);
 
 /********************************************************************/
 /* Compile time configuration and compatibility stuff               */

--===============23601616371053735==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23601616371053735==--
