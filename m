From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 26 Jan 2005 00:16:07 +0000
Subject: [KJ] [PATCH 22/34] media/planb: replace interruptible_sleep_on()
Message-Id: <20050126001607.GN12649@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============31492819894525836=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============31492819894525836==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event() instead of the deprecated
interruptible_sleep_on(). Current code does not check for signals, so
interruptible seems unnecessary.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/media/video/planb.c	2005-01-24 09:28:31.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/media/video/planb.c	2005-01-25 16:12:05.000000000 -0800
@@ -40,6 +40,7 @@
 #include <linux/mm.h>
 #include <linux/sched.h>
 #include <linux/videodev.h>
+#include <linux/wait.h>
 #include <asm/uaccess.h>
 #include <asm/io.h>
 #include <asm/prom.h>
@@ -1609,8 +1610,7 @@ static int planb_ioctl(struct video_devi
 				}
 				planb_lock(pb);
 				/* empty the grabbing queue */
-				while(pb->grabbing)
-					interruptible_sleep_on(&pb->capq);
+				wait_event(pb->capq, !pb->grabbing);
 				pb->maxlines = maxlines;
 				pb->win.norm = v.norm;
 				/* Stop overlay if running */

--===============31492819894525836==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============31492819894525836==--
