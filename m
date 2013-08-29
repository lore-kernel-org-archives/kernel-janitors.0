From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Aug 2013 08:23:36 +0000
Subject: [patch v2] [media] mx3-camera: locking cleanup in mx3_videobuf_queue()
Message-Id: <20130829082336.GA14334@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.1308280947190.22743@axis700.grange>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: Mauro Carvalho Chehab <m.chehab@samsung.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains about the locking here because we mix spin_lock_irq()
with spin_lock_irqsave() in an unusual way.  According to Smatch, it's
not always clear if the IRQs are enabled or disabled when we return.  It
turns out this function is always called with IRQs enabled and we can
just use spin_lock_irq().

It's called from __enqueue_in_driver().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: The first version changed everything to irq_save/restore() but that
    wasn't right because we wanted IRQs enabled and not simply restored.

diff --git a/drivers/media/platform/soc_camera/mx3_camera.c b/drivers/media/platform/soc_camera/mx3_camera.c
index 1047e3e..18eab8e 100644
--- a/drivers/media/platform/soc_camera/mx3_camera.c
+++ b/drivers/media/platform/soc_camera/mx3_camera.c
@@ -266,7 +266,6 @@ static void mx3_videobuf_queue(struct vb2_buffer *vb)
 	struct idmac_channel *ichan = mx3_cam->idmac_channel[0];
 	struct idmac_video_param *video = &ichan->params.video;
 	const struct soc_mbus_pixelfmt *host_fmt = icd->current_fmt->host_fmt;
-	unsigned long flags;
 	dma_cookie_t cookie;
 	size_t new_size;
 
@@ -328,7 +327,7 @@ static void mx3_videobuf_queue(struct vb2_buffer *vb)
 		memset(vb2_plane_vaddr(vb, 0), 0xaa, vb2_get_plane_payload(vb, 0));
 #endif
 
-	spin_lock_irqsave(&mx3_cam->lock, flags);
+	spin_lock_irq(&mx3_cam->lock);
 	list_add_tail(&buf->queue, &mx3_cam->capture);
 
 	if (!mx3_cam->active)
@@ -351,7 +350,7 @@ static void mx3_videobuf_queue(struct vb2_buffer *vb)
 	if (mx3_cam->active = buf)
 		mx3_cam->active = NULL;
 
-	spin_unlock_irqrestore(&mx3_cam->lock, flags);
+	spin_unlock_irq(&mx3_cam->lock);
 error:
 	vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
 }
