From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 21 Jan 2005 00:02:20 +0000
Subject: [KJ] [PATCH 23/39] net/svcsock: replace schedule_timeout() with
Message-Id: <20050121000220.GL2600@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============075055042122398774=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============075055042122398774==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use msleep() instead of schedule_timeout() to guarantee the task
delays as expected. The code, as is, is not wrong; however I see two reasons to
use msleep(): 1) consistency across the kernel; and 2) milliseconds are far more
human-comprehensible than jiffies.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/net/sunrpc/svcsock.c	2005-01-15 16:55:44.000000000 -0800
+++ 2.6.11-rc1-kj/net/sunrpc/svcsock.c	2005-01-18 13:05:24.000000000 -0800
@@ -32,6 +32,7 @@
 #include <linux/netdevice.h>
 #include <linux/skbuff.h>
 #include <linux/suspend.h>
+#include <linux/delay.h>
 #include <net/sock.h>
 #include <net/checksum.h>
 #include <net/ip.h>
@@ -1168,8 +1169,7 @@ svc_recv(struct svc_serv *serv, struct s
 	while (rqstp->rq_arghi < pages) {
 		struct page *p = alloc_page(GFP_KERNEL);
 		if (!p) {
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ/2);
+			msleep(500);
 			continue;
 		}
 		rqstp->rq_argpages[rqstp->rq_arghi++] = p;

--===============075055042122398774==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============075055042122398774==--
