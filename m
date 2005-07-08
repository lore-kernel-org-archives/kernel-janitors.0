From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Fri, 08 Jul 2005 19:37:13 +0000
Subject: [KJ] [PATCH] drivers/net/tulip/pnic.c : Use of time_after macro
Message-Id: <42CED5E9.7040000@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030804080803030105090304"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------030804080803030105090304
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Use of time_after() macro, defined at linux/jiffies.h, which deal with
wrapping correctly and are nicer to read.

--------------030804080803030105090304
Content-Type: text/x-patch;
 name="pnic.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="pnic.patch"

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/net/tulip/pnic.c	2005-06-17 16:48:29.000000000 -0300
+++ linux-kj/drivers/net/tulip/pnic.c	2005-07-07 23:06:05.788789480 -0300
@@ -16,6 +16,7 @@
 
 #include <linux/kernel.h>
 #include <linux/pci.h>
+#include <linux/jiffies.h>
 #include "tulip.h"
 
 
@@ -68,7 +69,8 @@
 		 */
 		if (tulip_media_cap[dev->if_port] & MediaIsMII)
 			return;
-		if (! tp->nwayset  ||  jiffies - dev->trans_start > 1*HZ) {
+		if (!tp->nwayset ||
+			       	time_after(jiffies, dev->trans_start + 1*HZ)) {
 			tp->csr6 = 0x00420000 | (tp->csr6 & 0x0000fdff);
 			iowrite32(tp->csr6, ioaddr + CSR6);
 			iowrite32(0x30, ioaddr + CSR12);

--------------030804080803030105090304
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------030804080803030105090304--
