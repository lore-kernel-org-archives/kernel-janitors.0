From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Fri, 08 Jul 2005 21:49:57 +0000
Subject: [KJ] [PATCH] drivers/scsi/qlogicpti.c : Use of time_after macro
Message-Id: <42CEF505.4050007@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------030802020400040302020802"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------030802020400040302020802
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

--------------030802020400040302020802
Content-Type: text/x-patch;
 name="qlogicpti.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="qlogicpti.patch"

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/scsi/qlogicpti.c	2005-06-17 16:48:29.000000000 -0300
+++ linux-kj/drivers/scsi/qlogicpti.c	2005-07-08 02:05:47.651697176 -0300
@@ -24,6 +24,7 @@
 #include <linux/spinlock.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/jiffies.h>
 
 #include <asm/byteorder.h>
 
@@ -1017,7 +1018,8 @@
 	if (Cmnd->device->tagged_supported) {
 		if (qpti->cmd_count[Cmnd->device->id] == 0)
 			qpti->tag_ages[Cmnd->device->id] = jiffies;
-		if ((jiffies - qpti->tag_ages[Cmnd->device->id]) > (5*HZ)) {
+		if (time_after(jiffies,
+				qpti->tag_ages[Cmnd->device->id] + 5*HZ)) {
 			cmd->control_flags = CFLAG_ORDERED_TAG;
 			qpti->tag_ages[Cmnd->device->id] = jiffies;
 		} else

--------------030802020400040302020802
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------030802020400040302020802--
