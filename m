From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:17:57 +0000
Subject: [KJ] [PATCH] drivers/char/agp/nvidia-agp.c : Use of the
Message-Id: <42D8B4A5.2090604@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------020005010803020009070204"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------020005010803020009070204
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------020005010803020009070204
Content-Type: text/x-patch;
 name="nvidia-agp.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="nvidia-agp.patch"

Use of the time_before_eq() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/char/agp/nvidia-agp.c	2005-06-17 16:48:29.000000000 -0300
+++ linux-kj/drivers/char/agp/nvidia-agp.c	2005-07-15 15:56:45.855515440 -0300
@@ -11,6 +11,7 @@
 #include <linux/gfp.h>
 #include <linux/page-flags.h>
 #include <linux/mm.h>
+#include <linux/jiffies.h>
 #include "agp.h"
 
 /* NVIDIA registers */
@@ -256,7 +257,7 @@
 		do {
 			pci_read_config_dword(nvidia_private.dev_1,
 					NVIDIA_1_WBC, &wbc_reg);
-			if ((signed)(end - jiffies) <= 0) {
+			if (time_before_eq(end, jiffies)) {
 				printk(KERN_ERR PFX
 				    "TLB flush took more than 3 seconds.\n");
 			}

--------------020005010803020009070204
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------020005010803020009070204--
