From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 25 Jan 2005 23:16:07 +0000
Subject: [KJ] [PATCH] 13/34: cdrom/mcd: remove sleep_on() usage
Message-Id: <20050125231607.GC12649@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============047869294761894832=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============047869294761894832==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Directly use wait-queues instead of the deprecated sleep_on().
This required adding a local waitqueue. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/cdrom/mcd.c	2005-01-24 09:34:04.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/cdrom/mcd.c	2005-01-25 11:37:29.000000000 -0800
@@ -95,6 +95,7 @@
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/config.h>
+#include <linux/wait.h>
 
 /* #define REALLY_SLOW_IO  */
 #include <asm/system.h>
@@ -1273,11 +1274,14 @@ static void mcdStatTimer(unsigned long d
 static int getMcdStatus(int timeout)
 {
 	int st;
+	DEFINE_WAIT(wait);
 
+	prepare_to_wait(&mcd_waitq, &wait, TASK_UNINTERRUPTIBLE);
 	McdTimeout = timeout;
 	mcd_timer.function = mcdStatTimer;
 	mod_timer(&mcd_timer, jiffies + 1);
-	sleep_on(&mcd_waitq);
+	schedule();
+	finish_wait(&mcd_waitq, &wait);
 	if (McdTimeout <= 0)
 		return -1;
 

--===============047869294761894832==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============047869294761894832==--
