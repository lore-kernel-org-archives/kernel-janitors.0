From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 26 Jan 2005 00:07:49 +0000
Subject: [KJ] [PATCH 21/34] isdn/isdn_common: replace
Message-Id: <20050126000749.GK12649@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7822980631070412=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============7822980631070412==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event() instead of the deprecated
interruptible_sleep_on(). Current code does not check for signals, so
interruptible seems unnecessary. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/isdn/i4l/isdn_common.c	2005-01-24 09:28:37.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/isdn/i4l/isdn_common.c	2005-01-24 15:54:03.000000000 -0800
@@ -19,6 +19,7 @@
 #include <linux/vmalloc.h>
 #include <linux/isdn.h>
 #include <linux/smp_lock.h>
+#include <linux/wait.h>
 #include "isdn_common.h"
 #include "isdn_tty.h"
 #include "isdn_net.h"
@@ -1066,8 +1067,8 @@ isdn_write(struct file *file, const char
 			goto out;
 		}
 		chidx = isdn_minor2chan(minor);
-		while (isdn_writebuf_stub(drvidx, chidx, buf, count) != count)
-			interruptible_sleep_on(&dev->drv[drvidx]->snd_waitq[chidx]);
+		wait_event(dev->drv[drvidx]->snd_waitq[chidx],
+				(isdn_writebuf_stub(drvidx, chidx, buf, count) == count));
 		retval = count;
 		goto out;
 	}

--===============7822980631070412==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7822980631070412==--
