From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 16:54:29 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2] pnpbios/core: replace
Message-Id: <20040927165429.GH1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51502881370503362=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============51502881370503362==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of
schedule_timeout() to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/pnp/pnpbios/core.c	2004-09-13 17:16:06.000000000 -0700
+++ 2.6.9-rc2/drivers/pnp/pnpbios/core.c	2004-09-27 09:52:49.000000000 -0700
@@ -60,6 +60,7 @@
 #include <linux/completion.h>
 #include <linux/spinlock.h>
 #include <linux/dmi.h>
+#include <linux/delay.h>
 
 #include <asm/page.h>
 #include <asm/desc.h>
@@ -177,8 +178,7 @@ static int pnp_dock_thread(void * unused
 		/*
 		 * Poll every 2 seconds
 		 */
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout(HZ*2);
+		msleep_interruptible(2000);
 		if(signal_pending(current))
 			break;
 

--===============51502881370503362==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51502881370503362==--
