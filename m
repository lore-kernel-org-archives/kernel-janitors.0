From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 26 Jan 2005 00:22:08 +0000
Subject: [KJ] [PATCH 24/34] media/zoran_driver: replace
Message-Id: <20050126002208.GP12649@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============81982602944549399=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============81982602944549399==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_interruptible_timeout() instead of the
deprecated interruptible_sleep_on_timeout(). Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-rc2-kj-v/drivers/media/video/zoran_driver.c	2005-01-24 09:34:08.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/media/video/zoran_driver.c	2005-01-25 16:20:39.000000000 -0800
@@ -52,6 +52,7 @@
 #include <linux/slab.h>
 #include <linux/pci.h>
 #include <linux/vmalloc.h>
+#include <linux/wait.h>
 #include <linux/byteorder/generic.h>
 
 #include <linux/interrupt.h>
@@ -918,12 +919,12 @@ v4l_sync (struct file *file,
 	}
 
 	/* wait on this buffer to get ready */
-	while (zr->v4l_buffers.buffer[frame].state == BUZ_STATE_PEND) {
-		if (!interruptible_sleep_on_timeout(&zr->v4l_capq, 10 * HZ))
-			return -ETIME;
-		else if (signal_pending(current))
-			return -ERESTARTSYS;
-	}
+	if (!wait_event_interruptible_timeout(zr->v4l_capq,
+				(zr->v4l_buffers.buffer[frame].state != BUZ_STATE_PEND),
+				10*HZ))
+		return -ETIME;
+	if (signal_pending(current))
+		return -ERESTARTSYS;
 
 	/* buffer should now be in BUZ_STATE_DONE */
 	if (zr->v4l_buffers.buffer[frame].state != BUZ_STATE_DONE)
@@ -1107,7 +1108,7 @@ jpg_sync (struct file       *file,
 	struct zoran_fh *fh = file->private_data;
 	struct zoran *zr = fh->zr;
 	unsigned long flags;
-	int frame, timeout;
+	int frame;
 
 	if (fh->jpg_buffers.active == ZORAN_FREE) {
 		dprintk(1,
@@ -1124,29 +1125,26 @@ jpg_sync (struct file       *file,
 			ZR_DEVNAME(zr));
 		return -EINVAL;
 	}
-	while (zr->jpg_que_tail == zr->jpg_dma_tail) {
-		if (zr->jpg_dma_tail == zr->jpg_dma_head)
-			break;
-
-		timeout =
-		    interruptible_sleep_on_timeout(&zr->jpg_capq, 10 * HZ);
-		if (!timeout) {
-			int isr;
-
-			btand(~ZR36057_JMC_Go_en, ZR36057_JMC);
-			udelay(1);
-			zr->codec->control(zr->codec, CODEC_G_STATUS,
+	if (!wait_event_interruptible_timeout(zr->jpg_capq,
+			(zr->jpg_que_tail != zr->jpg_dma_tail ||
+			 zr->jpg_dma_tail == zr->jpg_dma_head),
+			10*HZ)) {
+		int isr;
+
+		btand(~ZR36057_JMC_Go_en, ZR36057_JMC);
+		udelay(1);
+		zr->codec->control(zr->codec, CODEC_G_STATUS,
 					   sizeof(isr), &isr);
-			dprintk(1,
-				KERN_ERR
-				"%s: jpg_sync() - timeout: codec isr=0x%02x\n",
-				ZR_DEVNAME(zr), isr);
+		dprintk(1,
+			KERN_ERR
+			"%s: jpg_sync() - timeout: codec isr=0x%02x\n",
+			ZR_DEVNAME(zr), isr);
 
-			return -ETIME;
+		return -ETIME;
 
-		} else if (signal_pending(current))
-			return -ERESTARTSYS;
 	}
+	if (signal_pending(current))
+		return -ERESTARTSYS;
 
 	spin_lock_irqsave(&zr->spinlock, flags);
 

--===============81982602944549399==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============81982602944549399==--
