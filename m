From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 20 Jan 2005 19:10:52 +0000
Subject: [KJ] [PATCH 10/40] fs/vfs: replace schedule_timeout() with msleep()
Message-Id: <20050120191052.GK5393@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18349868868377905=="
List-Id: <kernel-janitors.vger.kernel.org>
To: neilb@cse.unsw.edu.au
Cc: kernel-janitors@lists.osdl.org, nfs@lists.sourceforge.net

--===============18349868868377905==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use msleep() instead of schedule_timeout() to guarantee the task
delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/fs/nfsd/vfs.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/fs/nfsd/vfs.c	2005-01-18 11:06:03.000000000 -0800
@@ -36,6 +36,7 @@
 #include <linux/module.h>
 #include <linux/namei.h>
 #include <linux/vfs.h>
+#include <linux/delay.h>
 #include <linux/sunrpc/svc.h>
 #include <linux/nfsd/nfsd.h>
 #ifdef CONFIG_NFSD_V3
@@ -965,8 +966,7 @@ nfsd_write(struct svc_rqst *rqstp, struc
 			if (atomic_read(&inode->i_writecount) > 1
 			    || (last_ino == inode->i_ino && last_dev == inode->i_sb->s_dev)) {
 				dprintk("nfsd: write defer %d\n", current->pid);
-				set_current_state(TASK_UNINTERRUPTIBLE);
-				schedule_timeout((HZ+99)/100);
+				msleep(10);
 				dprintk("nfsd: write resume %d\n", current->pid);
 			}
 

--===============18349868868377905==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18349868868377905==--
