From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 20 Jan 2005 18:23:51 +0000
Subject: [KJ] [PATCH 4/40] block/ps2esdi: replace sleep_on() with
Message-Id: <20050120182351.GE5393@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8559529534581205=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============8559529534581205==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event() instead of the deprecated sleep_on(). In all
replacements, wait_event() expects the condition to *stop* on, so the existing
conditional is negated and passed as the parameter. I am not sure if these
changes are appropriate, as the condition to pass to wait_event() to guarantee
the same behavior; I think this is the best choice, though.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/block/ps2esdi.c	2005-01-15 16:55:43.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/block/ps2esdi.c	2005-01-19 17:55:55.000000000 -0800
@@ -43,6 +43,7 @@
 #include <linux/init.h>
 #include <linux/ioport.h>
 #include <linux/module.h>
+#include <linux/delay.h>
 
 #include <asm/system.h>
 #include <asm/io.h>
@@ -461,8 +462,7 @@ static void __init ps2esdi_get_device_cf
 	cmd_blk[1] = 0;
 	no_int_yet = TRUE;
 	ps2esdi_out_cmd_blk(cmd_blk);
-	if (no_int_yet)
-		sleep_on(&ps2esdi_int);
+	wait_event(ps2esdi_int, !no_int_yet);
 
 	if (ps2esdi_drives > 1) {
 		printk("%s: Drive 1\n", DEVICE_NAME);	/*BA */
@@ -470,8 +470,7 @@ static void __init ps2esdi_get_device_cf
 		cmd_blk[1] = 0;
 		no_int_yet = TRUE;
 		ps2esdi_out_cmd_blk(cmd_blk);
-		if (no_int_yet)
-			sleep_on(&ps2esdi_int);
+		wait_event(ps2esdi_int, !no_int_yet);
 	}			/* if second physical drive is present */
 	return;
 }

--===============8559529534581205==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8559529534581205==--
