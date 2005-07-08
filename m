From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Fri, 08 Jul 2005 19:31:19 +0000
Subject: [KJ] [PATCH] drivers/scsi/ppa.c : Use of time_after macro
Message-Id: <42CED487.2010606@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020200060508090202070802"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------020200060508090202070802
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

--------------020200060508090202070802
Content-Type: text/x-patch;
 name="ppa.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ppa.patch"

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/scsi/ppa.c	2005-07-07 19:11:54.000000000 -0300
+++ linux-kj/drivers/scsi/ppa.c	2005-07-08 02:03:59.567128528 -0300
@@ -18,6 +18,7 @@
 #include <linux/parport.h>
 #include <linux/workqueue.h>
 #include <linux/delay.h>
+#include <linux/jiffies.h>
 #include <asm/io.h>
 
 #include <scsi/scsi.h>
@@ -726,7 +727,7 @@
 				retv--;
 
 			if (retv) {
-				if ((jiffies - dev->jstart) > (1 * HZ)) {
+				if (time_after(jiffies, dev->jstart + 1 * HZ)) {
 					printk
 					    ("ppa: Parallel port cable is unplugged!!\n");
 					ppa_fail(dev, DID_BUS_BUSY);

--------------020200060508090202070802
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------020200060508090202070802--
