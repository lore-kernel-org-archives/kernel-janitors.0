From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 20 Jan 2005 19:03:52 +0000
Subject: [KJ] [PATCH 7/40] fs/nfs4callback: replace schedule_timeout() with
Message-Id: <20050120190352.GH5393@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72527295586027218=="
List-Id: <kernel-janitors.vger.kernel.org>
To: neilb@cse.unsw.edu.au
Cc: kernel-janitors@lists.osdl.org, nfs@lists.sourceforge.net

--===============72527295586027218==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use ssleep() instead of schedule_timeout() to guarantee the task
delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/fs/nfsd/nfs4callback.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/fs/nfsd/nfs4callback.c	2005-01-18 11:03:27.000000000 -0800
@@ -38,6 +38,7 @@
 #include <linux/list.h>
 #include <linux/inet.h>
 #include <linux/errno.h>
+#include <linux/delay.h>
 #include <linux/sunrpc/xdr.h>
 #include <linux/sunrpc/svc.h>
 #include <linux/sunrpc/clnt.h>
@@ -531,8 +532,7 @@ out:
 retry:
 	atomic_inc(&dp->dl_recall_cnt);
 	/* sleep 2 seconds before retrying recall */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(2*HZ);
+	ssleep(2);
 	status = nfsd4_cb_recall(dp);
 	dprintk("NFSD: nfs4_cb_recall_done: retry status: %d  dp %p dl_flock %p\n",status,dp, dp->dl_flock);
 }

--===============72527295586027218==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72527295586027218==--
