From: Dan Carpenter <error27@gmail.com>
Date: Thu, 09 Dec 2010 05:35:40 +0000
Subject: [patch] drm: use after free in drm_queue_vblank_event()
Message-Id: <20101209053540.GR10623@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

The "e" pointer is either NULL or freed when we call
drm_vblank_put(dev, e->pipe) on the error path.  Just pass the "pipe"
variable directly instead.

I changed another caller to use "pipe" as well for consistency.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/drm_irq.c b/drivers/gpu/drm/drm_irq.c
index 722700d..16d5155 100644
--- a/drivers/gpu/drm/drm_irq.c
+++ b/drivers/gpu/drm/drm_irq.c
@@ -628,7 +628,7 @@ static int drm_queue_vblank_event(struct drm_device *dev, int pipe,
 	if ((seq - vblwait->request.sequence) <= (1 << 23)) {
 		e->event.tv_sec = now.tv_sec;
 		e->event.tv_usec = now.tv_usec;
-		drm_vblank_put(dev, e->pipe);
+		drm_vblank_put(dev, pipe);
 		list_add_tail(&e->base.link, &e->base.file_priv->event_list);
 		wake_up_interruptible(&e->base.file_priv->event_wait);
 		trace_drm_vblank_event_delivered(current->pid, pipe,
@@ -645,7 +645,7 @@ err_unlock:
 	spin_unlock_irqrestore(&dev->event_lock, flags);
 	kfree(e);
 err_put:
-	drm_vblank_put(dev, e->pipe);
+	drm_vblank_put(dev, pipe);
 	return ret;
 }
 
