From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 26 Jan 2005 00:18:26 +0000
Subject: [KJ] [PATCH 23/34] media/zoran_device: replace
Message-Id: <20050126001826.GO12649@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3986935434524701=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============3986935434524701==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_interruptible() instead of the deprecated
interruptible_sleep_on(). Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/media/video/zoran_device.c	2005-01-24 09:34:08.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/media/video/zoran_device.c	2005-01-24 16:07:07.000000000 -0800
@@ -46,6 +46,7 @@
 #include <linux/video_decoder.h>
 #include <linux/video_encoder.h>
 #include <linux/delay.h>
+#include <linux/wait.h>
 
 #include <asm/io.h>
 
@@ -696,11 +697,10 @@ wait_grab_pending (struct zoran *zr)
 	if (!zr->v4l_memgrab_active)
 		return 0;
 
-	while (zr->v4l_pend_tail != zr->v4l_pend_head) {
-		interruptible_sleep_on(&zr->v4l_capq);
-		if (signal_pending(current))
-			return -ERESTARTSYS;
-	}
+	wait_event_interruptible(zr->v4l_capq,
+			(zr->v4l_pend_tail == zr->v4l_pend_head));
+	if (signal_pending(current))
+		return -ERESTARTSYS;
 
 	spin_lock_irqsave(&zr->spinlock, flags);
 	zr36057_set_memgrab(zr, 0);

--===============3986935434524701==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3986935434524701==--
