From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 25 Jan 2005 22:30:58 +0000
Subject: [KJ] [PATCH] 7/34: block/ps2esdi: replace sleep_on() with
Message-Id: <20050125223058.GH2689@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7270018618599341=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============7270018618599341==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event() instead of the deprecated sleep_on(). The latter
two replacements treat the current if-conditional as a while-conditional. I am
not sure if this will result in the desired behavior. The first change required
using wait-queue code directly with a local wait-queue, as the sleep is not
conditional currently.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/block/ps2esdi.c	2005-01-24 09:34:04.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/block/ps2esdi.c	2005-01-25 13:39:48.000000000 -0800
@@ -43,6 +43,7 @@
 #include <linux/init.h>
 #include <linux/ioport.h>
 #include <linux/module.h>
+#include <linux/delay.h>
 
 #include <asm/system.h>
 #include <asm/io.h>
@@ -292,6 +293,7 @@ static int __init ps2esdi_geninit(void)
 	   we will set the INIT_FLAG to a non-zero value.
 	 */
 
+	DEFINE_WAIT(wait);
 	int slot = 0, i, reset_start, reset_end;
 	u_char status;
 	unsigned short adapterID;
@@ -373,11 +375,13 @@ static int __init ps2esdi_geninit(void)
 	reset_status = 0;
 	reset_start = jiffies;
 	while (!reset_status) {
+		prepare_to_wait(&ps2esdi_int, &wait, TASK_UNINTERRUPTIBLE);
 		init_timer(&esdi_timer);
 		esdi_timer.expires = jiffies + HZ;
 		esdi_timer.data = 0;
 		add_timer(&esdi_timer);
-		sleep_on(&ps2esdi_int);
+		schedule();
+		finish_wait(&ps2esdi_int, &wait);
 	}
 	reset_end = jiffies;
 	LITE_OFF;
@@ -461,8 +465,7 @@ static void __init ps2esdi_get_device_cf
 	cmd_blk[1] = 0;
 	no_int_yet = TRUE;
 	ps2esdi_out_cmd_blk(cmd_blk);
-	if (no_int_yet)
-		sleep_on(&ps2esdi_int);
+	wait_event(ps2esdi_int, !no_int_yet);
 
 	if (ps2esdi_drives > 1) {
 		printk("%s: Drive 1\n", DEVICE_NAME);	/*BA */
@@ -470,8 +473,7 @@ static void __init ps2esdi_get_device_cf
 		cmd_blk[1] = 0;
 		no_int_yet = TRUE;
 		ps2esdi_out_cmd_blk(cmd_blk);
-		if (no_int_yet)
-			sleep_on(&ps2esdi_int);
+		wait_event(ps2esdi_int, !no_int_yet);
 	}			/* if second physical drive is present */
 	return;
 }

--===============7270018618599341==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7270018618599341==--
