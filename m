From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 23:22:22 +0000
Subject: [Kernel-janitors] [PATCH] message/i2o_block: replace
Message-Id: <20040726232222.GB1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91854640080048133=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============91854640080048133==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() so the task
is guaranteed to delay the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/message/i2o/i2o_block.c	2004-06-16 05:19:43.000000000 +0000
+++ linux-dev/drivers/message/i2o/i2o_block.c	2004-07-21 17:25:45.000000000 +0000
@@ -75,6 +75,7 @@
 #include <linux/hdreg.h>
 #include <linux/spinlock.h>
 #include <linux/bio.h>
+#include <linux/delay.h>
 
 #include <linux/notifier.h>
 #include <linux/reboot.h>
@@ -1659,8 +1660,7 @@ static void i2o_block_exit(void)
 	 *	This isnt ideal at all but will do for now.
 	 */
 	 
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ);
+	msleep(1000);
 	
 	/*
 	 *	Flush the OSM

--===============91854640080048133==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91854640080048133==--
