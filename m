From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 20 Jan 2005 19:02:09 +0000
Subject: [KJ] [PATCH 6/40] fs/jfs_logmgr: replace schedule_timeout() with
Message-Id: <20050120190209.GG5393@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23834994316250846=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============23834994316250846==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use msleep() instead of schedule_timeout() to guarantee the task
delays as expected. The current code uses TASK_INTERRUPTIBLE; however, it does
not check for signals, so I do not think the change to msleep() is necessarily
bad.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/fs/jfs/jfs_logmgr.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/fs/jfs/jfs_logmgr.c	2005-01-18 10:53:46.000000000 -0800
@@ -67,6 +67,7 @@
 #include <linux/buffer_head.h>		/* for sync_blockdev() */
 #include <linux/bio.h>
 #include <linux/suspend.h>
+#include <linux/delay.h>
 #include "jfs_incore.h"
 #include "jfs_filsys.h"
 #include "jfs_metapage.h"
@@ -1612,8 +1613,7 @@ void jfs_flush_journal(struct jfs_log *l
 	 */
 	if ((!list_empty(&log->cqueue)) || !list_empty(&log->synclist)) {
 		for (i = 0; i < 800; i++) {	/* Too much? */
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(HZ / 4);
+			msleep(250);
 			if (list_empty(&log->cqueue) &&
 			    list_empty(&log->synclist))
 				break;

--===============23834994316250846==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23834994316250846==--
