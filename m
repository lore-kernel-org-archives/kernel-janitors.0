From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 25 Jan 2005 23:10:25 +0000
Subject: [KJ] [PATCH] 11/34: cdrom/aztcd: remove sleep_on() usage
Message-Id: <20050125231025.GA12649@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============48934964194057046=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============48934964194057046==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Directly use wait-queues instead of the deprecated sleep_on().
This required adding a local waitqueue. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/cdrom/aztcd.c	2005-01-24 09:34:04.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/cdrom/aztcd.c	2005-01-25 15:08:34.000000000 -0800
@@ -180,6 +180,7 @@
 #include <linux/ioport.h>
 #include <linux/string.h>
 #include <linux/major.h>
+#include <linux/wait.h>
 
 #include <linux/init.h>
 
@@ -430,9 +431,12 @@ static void dten_low(void)
 #define STEN_LOW_WAIT   statusAzt()
 static void statusAzt(void)
 {
+	DEFINE_WAIT(wait);
 	AztTimeout = AZT_STATUS_DELAY;
 	SET_TIMER(aztStatTimer, HZ / 100);
-	sleep_on(&azt_waitq);
+	prepare_to_wait(&azt_waitq, &wait, TASK_UNINTERRUPTIBLE);
+	schedule();
+	finish_wait(&azt_waitq, &wait);
 	if (AztTimeout <= 0)
 		printk("aztcd: Error Wait STEN_LOW_WAIT command:%x\n",
 		       aztCmd);

--===============48934964194057046==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============48934964194057046==--
