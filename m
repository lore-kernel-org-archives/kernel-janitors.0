From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 26 Jan 2005 00:24:01 +0000
Subject: [KJ] [PATCH 25/34] media/zr36120: replace interruptible_sleep_on()
Message-Id: <20050126002401.GQ12649@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26615631786682736=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============26615631786682736==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_interruptible() instead of the deprecated
interruptible_sleep_on().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/media/video/zr36120.c	2005-01-24 09:34:08.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/media/video/zr36120.c	2005-01-24 16:10:05.000000000 -0800
@@ -30,6 +30,7 @@
 #include <linux/mm.h>
 #include <linux/pci.h>
 #include <linux/signal.h>
+#include <linux/wait.h>
 #include <asm/io.h>
 #include <asm/pgtable.h>
 #include <asm/page.h>
@@ -899,12 +900,11 @@ long zoran_read(struct video_device* dev
 		zoran_cap(ztv, 1);
 
 		/* wait till this buffer gets grabbed */
-		while (unused->status == FBUFFER_BUSY) {
-			interruptible_sleep_on(&ztv->grabq);
-			/* see if a signal did it */
-			if (signal_pending(current))
-				return -EINTR;
-		}
+		wait_event_interruptible(ztv->grabq,
+				(unused->status != FBUFFER_BUSY));
+		/* see if a signal did it */
+		if (signal_pending(current))
+			return -EINTR;
 		done = unused;
 	}
 	else
@@ -1326,12 +1326,11 @@ int zoran_ioctl(struct video_device* dev
 			return -EINVAL;
 		 case FBUFFER_BUSY:
 			/* wait till this buffer gets grabbed */
-			while (ztv->grabinfo[i].status == FBUFFER_BUSY) {
-				interruptible_sleep_on(&ztv->grabq);
-				/* see if a signal did it */
-				if (signal_pending(current))
-					return -EINTR;
-			}
+			wait_event_interruptible(ztv->grabq,
+					(ztv->grabinfo[i].status != FBUFFER_BUSY));
+			/* see if a signal did it */
+			if (signal_pending(current))
+				return -EINTR;
 			/* don't fall through; a DONE buffer is not UNUSED */
 			break;
 		 case FBUFFER_DONE:
@@ -1640,12 +1639,11 @@ long vbi_read(struct video_device* dev, 
 		zoran_cap(ztv, 1);
 
 		/* wait till this buffer gets grabbed */
-		while (unused->status == FBUFFER_BUSY) {
-			interruptible_sleep_on(&ztv->vbiq);
-			/* see if a signal did it */
-			if (signal_pending(current))
-				return -EINTR;
-		}
+		wait_event_interruptible(ztv->vbiq,
+				(unused->status != FBUFFER_BUSY));
+		/* see if a signal did it */
+		if (signal_pending(current))
+			return -EINTR;
 		done = unused;
 	}
 	else

--===============26615631786682736==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26615631786682736==--
