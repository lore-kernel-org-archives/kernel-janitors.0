From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 20 Jan 2005 18:56:17 +0000
Subject: [KJ] [PATCH 5/40] fs/clntproc: replace schedule_timeout() with
Message-Id: <20050120185617.GF5393@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36210098598827001=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============36210098598827001==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use msleep_interruptible() instead of schedule_timeout(). The
existing code is not incorrect, but msleep_interruptible() offers two
advantages: 1) consistency across the kernel and 2) human-sensible time units
(msecs).

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/fs/lockd/clntproc.c	2005-01-15 16:55:41.000000000 -0800
+++ 2.6.11-rc1-kj/fs/lockd/clntproc.c	2005-01-18 10:55:03.000000000 -0800
@@ -14,6 +14,7 @@
 #include <linux/nfs_fs.h>
 #include <linux/utsname.h>
 #include <linux/smp_lock.h>
+#include <linux/delay.h>
 #include <linux/sunrpc/clnt.h>
 #include <linux/sunrpc/svc.h>
 #include <linux/lockd/lockd.h>
@@ -298,8 +299,7 @@ nlmclnt_alloc_call(void)
 			return call;
 		}
 		printk("nlmclnt_alloc_call: failed, waiting for memory\n");
-		current->state = TASK_INTERRUPTIBLE;
-		schedule_timeout(5*HZ);
+		msleep_interruptible(5000);
 	}
 	return NULL;
 }

--===============36210098598827001==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36210098598827001==--
