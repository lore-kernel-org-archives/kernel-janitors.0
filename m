From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 16:46:38 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 2/5] pcmcia/ds: replace
Message-Id: <20040927164638.GD1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15631346543801494=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============15631346543801494==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of
schedule_timeout() to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/pcmcia/ds.c	2004-09-13 17:16:07.000000000 -0700
+++ 2.6.9-rc2/drivers/pcmcia/ds.c	2004-09-27 09:46:12.000000000 -0700
@@ -51,6 +51,7 @@
 #include <linux/pci.h>
 #include <linux/list.h>
 #include <linux/workqueue.h>
+#include <linux/delay.h>
 
 #include <asm/atomic.h>
 
@@ -1080,8 +1081,7 @@ static int __devinit pcmcia_bus_add_sock
 	 * Ugly. But we want to wait for the socket threads to have started up.
 	 * We really should let the drivers themselves drive some of this..
 	 */
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(HZ/4);
+	msleep_interruptible(250);
 
 	init_waitqueue_head(&s->queue);
 	init_waitqueue_head(&s->request);

--===============15631346543801494==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15631346543801494==--
