From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 20 Jan 2005 19:05:42 +0000
Subject: [KJ] [PATCH 8/40] fs/proc: replace schedule_timeout() with msleep()
Message-Id: <20050120190542.GI5393@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============013823857040715204=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============013823857040715204==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use msleep() instead of schedule_timeout() to guarantee the task
delays as expected. TASK_INTERRUPTIBLE is used in the current code, but signals
are not checked for, so I believe the change to msleep() is appropriate.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/fs/smbfs/proc.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/fs/smbfs/proc.c	2005-01-18 11:07:41.000000000 -0800
@@ -23,6 +23,7 @@
 #include <linux/smb_fs.h>
 #include <linux/smbno.h>
 #include <linux/smb_mount.h>
+#include <linux/delay.h>
 
 #include <net/sock.h>
 
@@ -2397,8 +2398,7 @@ smb_proc_readdir_long(struct file *filp,
 		if (req->rq_rcls == ERRSRV && req->rq_err == ERRerror) {
 			/* a damn Win95 bug - sometimes it clags if you 
 			   ask it too fast */
-			current->state = TASK_INTERRUPTIBLE;
-			schedule_timeout(HZ/5);
+			msleep(200);
 			continue;
                 }
 

--===============013823857040715204==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============013823857040715204==--
