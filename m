From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Aug 2013 09:45:30 +0000
Subject: [patch] [media] mx3-camera: locking typo in mx3_videobuf_queue()
Message-Id: <20130823094530.GN31293@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a return in the middle where we haven't restored the IRQs to
their original state.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/platform/soc_camera/mx3_camera.c b/drivers/media/platform/soc_camera/mx3_camera.c
index 1047e3e..4bae910 100644
--- a/drivers/media/platform/soc_camera/mx3_camera.c
+++ b/drivers/media/platform/soc_camera/mx3_camera.c
@@ -334,7 +334,7 @@ static void mx3_videobuf_queue(struct vb2_buffer *vb)
 	if (!mx3_cam->active)
 		mx3_cam->active = buf;
 
-	spin_unlock_irq(&mx3_cam->lock);
+	spin_unlock_irqrestore(&mx3_cam->lock, flags);
 
 	cookie = txd->tx_submit(txd);
 	dev_dbg(icd->parent, "Submitted cookie %d DMA 0x%08x\n",
@@ -343,7 +343,7 @@ static void mx3_videobuf_queue(struct vb2_buffer *vb)
 	if (cookie >= 0)
 		return;
 
-	spin_lock_irq(&mx3_cam->lock);
+	spin_lock_irqsave(&mx3_cam->lock, flags);
 
 	/* Submit error */
 	list_del_init(&buf->queue);
