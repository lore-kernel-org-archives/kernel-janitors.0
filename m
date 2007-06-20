From: Diego Woitasen <diegows@lanux.org.ar>
Date: Wed, 20 Jun 2007 00:38:59 +0000
Subject: [KJ] [PATCH] Remove unneeded lock_kernel() in driveres/block/loop.c
Message-Id: <20070620003859.GF14563@motherbox.xtechq.com.ar>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch remove the unneeded lock_kernel() in drivers/block/loop.c. I
read the code as this lock_kernel() doesn't protect anything. Loopback
code use lo_ctl_mutex with syncronization.

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 0ed5470..1cc004e 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1286,7 +1286,6 @@ static long lo_compat_ioctl(struct file *file, unsigned int cmd, unsigned long a
 	struct loop_device *lo = inode->i_bdev->bd_disk->private_data;
 	int err;
 
-	lock_kernel();
 	switch(cmd) {
 	case LOOP_SET_STATUS:
 		mutex_lock(&lo->lo_ctl_mutex);
@@ -1312,7 +1311,6 @@ static long lo_compat_ioctl(struct file *file, unsigned int cmd, unsigned long a
 		err = -ENOIOCTLCMD;
 		break;
 	}
-	unlock_kernel();
 	return err;
 }
 #endif


-- 

--------------
Diego Woitasen
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
