From: Dan Carpenter <error27@gmail.com>
Date: Sun, 28 Mar 2010 11:19:47 +0000
Subject: [patch] via: off by one issue
Message-Id: <20100328111947.GH5069@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"fx->lock" is used as the index in "dev_priv->decoder_queue[fx->lock]"
which is an array of "VIA_NR_XVMC_LOCKS" elements.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/via/via_video.c b/drivers/gpu/drm/via/via_video.c
index 6ec04ac..6efac81 100644
--- a/drivers/gpu/drm/via/via_video.c
+++ b/drivers/gpu/drm/via/via_video.c
@@ -75,7 +75,7 @@ int via_decoder_futex(struct drm_device *dev, void *data, struct drm_file *file_
 
 	DRM_DEBUG("\n");
 
-	if (fx->lock > VIA_NR_XVMC_LOCKS)
+	if (fx->lock >= VIA_NR_XVMC_LOCKS)
 		return -EFAULT;
 
 	lock = (volatile int *)XVMCLOCKPTR(sAPriv, fx->lock);
