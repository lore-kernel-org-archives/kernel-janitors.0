From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 25 Jan 2005 23:19:54 +0000
Subject: [KJ] [PATCH] 15/34: cdrom/sjcd: remove sleep_on() usage
Message-Id: <20050125231954.GE12649@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67103301136016125=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============67103301136016125==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Directly use wait-queues instead of the deprecated sleep_on().
This required adding a local waitqueue. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/cdrom/sjcd.c	2005-01-24 09:34:04.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/cdrom/sjcd.c	2005-01-25 15:19:12.000000000 -0800
@@ -70,6 +70,7 @@
 #include <linux/string.h>
 #include <linux/major.h>
 #include <linux/init.h>
+#include <linux/wait.h>
 
 #include <asm/system.h>
 #include <asm/io.h>
@@ -407,9 +408,12 @@ static void sjcd_status_timer(void)
  */
 static int sjcd_wait_for_status(void)
 {
+	DEFINE_WAIT(wait);
 	sjcd_status_timeout = SJCD_WAIT_FOR_STATUS_TIMEOUT;
 	SJCD_SET_TIMER(sjcd_status_timer, 1);
-	sleep_on(&sjcd_waitq);
+	prepare_to_wait(&sjcd_waitq, &wait, TASK_UNINTERRUPTIBLE);
+	schedule();
+	finish_wait(&sjcd_waitq, &wait);
 #if defined( SJCD_DIAGNOSTIC ) || defined ( SJCD_TRACE )
 	if (sjcd_status_timeout <= 0)
 		printk("SJCD: Error Wait For Status.\n");

--===============67103301136016125==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67103301136016125==--
