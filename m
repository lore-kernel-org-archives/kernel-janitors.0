From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 20 Jan 2005 19:14:19 +0000
Subject: [KJ] [PATCH 12/40] fs/xfs_super: replace schedule_timeout() with
Message-Id: <20050120191419.GM5393@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64954358285477021=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============64954358285477021==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use msleep_interruptible() instead of schedule_timeout(). The
current code is not wrong; however a change to msleep_interruptible() has two
major benefits: 1) consistency across the kernel and 2) uses human-sensible time
units (msecs). Change the units of timeleft appropriately to msecs.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/fs/xfs/linux-2.6/xfs_super.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/fs/xfs/linux-2.6/xfs_super.c	2005-01-18 11:12:02.000000000 -0800
@@ -73,6 +73,7 @@
 #include <linux/mount.h>
 #include <linux/suspend.h>
 #include <linux/writeback.h>
+#include <linux/delay.h>
 
 STATIC struct quotactl_ops linvfs_qops;
 STATIC struct super_operations linvfs_sops;
@@ -484,10 +485,9 @@ xfssyncd(
 	wake_up(&vfsp->vfs_wait_sync_task);
 
 	INIT_LIST_HEAD(&tmp);
-	timeleft = (xfs_syncd_centisecs * HZ) / 100;
+	timeleft = xfs_syncd_centisecs * 10;
 	for (;;) {
-		set_current_state(TASK_INTERRUPTIBLE);
-		timeleft = schedule_timeout(timeleft);
+		timeleft = msleep_interruptible(timeleft);
 		/* swsusp */
 		if (current->flags & PF_FREEZE)
 			refrigerator(PF_FREEZE);
@@ -502,7 +502,7 @@ xfssyncd(
 		 */
 		if (!timeleft || list_empty(&vfsp->vfs_sync_list)) {
 			if (!timeleft)
-				timeleft = (xfs_syncd_centisecs * HZ) / 100;
+				timeleft = xfs_syncd_centisecs * 10;
 			INIT_LIST_HEAD(&vfsp->vfs_sync_work.w_list);
 			list_add_tail(&vfsp->vfs_sync_work.w_list,
 					&vfsp->vfs_sync_list);

--===============64954358285477021==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64954358285477021==--
