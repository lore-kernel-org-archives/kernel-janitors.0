From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 20 Jan 2005 19:12:29 +0000
Subject: [KJ] [PATCH 11/40] fs/xfs_buf: replace schedule_timeout() with
Message-Id: <20050120191229.GL5393@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6326330461165699=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============6326330461165699==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use msleep() instead of schedule_timeout() to guarantee the task
delays as expected. The current code uses TASK_INTERRUPTIBLE, but does not check
for signals, so I believe the change to msleep() is appropriate.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/fs/xfs/linux-2.6/xfs_buf.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/fs/xfs/linux-2.6/xfs_buf.c	2005-01-18 11:09:34.000000000 -0800
@@ -54,6 +54,7 @@
 #include <linux/suspend.h>
 #include <linux/percpu.h>
 #include <linux/blkdev.h>
+#include <linux/delay.h>
 
 #include "xfs_linux.h"
 
@@ -1689,8 +1690,7 @@ pagebuf_daemon(
 		if (current->flags & PF_FREEZE)
 			refrigerator(PF_FREEZE);
 
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout((xfs_buf_timer_centisecs * HZ) / 100);
+		msleep(xfs_buf_timer_centisecs * 10);
 
 		age = (xfs_buf_age_centisecs * HZ) / 100;
 		spin_lock(&pbd_delwrite_lock);

--===============6326330461165699==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6326330461165699==--
