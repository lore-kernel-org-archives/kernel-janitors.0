From: Shani Moideen <shani.moideen@wipro.com>
Date: Thu, 14 Jun 2007 11:32:21 +0000
Subject: [KJ] [KJ PATCH] Replacing memset(<addr>,0,PAGE_SIZE) with
Message-Id: <1181820021.2297.7.camel@shani-win>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1178621156.3598.10.camel@shani-win>
In-Reply-To: <1178621156.3598.10.camel@shani-win>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Replacing memset(<addr>,0,PAGE_SIZE) with clear_page(<addr>)
in drivers/char/drm/i915_dma.c

Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
----

diff --git a/drivers/char/drm/i915_dma.c b/drivers/char/drm/i915_dma.c
index 1ba15d9..4f17eb6 100644
--- a/drivers/char/drm/i915_dma.c
+++ b/drivers/char/drm/i915_dma.c
@@ -191,7 +191,7 @@ static int i915_initialize(drm_device_t * dev,
 	dev_priv->hw_status_page = dev_priv->status_page_dmah->vaddr;
 	dev_priv->dma_status_page = dev_priv->status_page_dmah->busaddr;
 
-	memset(dev_priv->hw_status_page, 0, PAGE_SIZE);
+	clear_page(dev_priv->hw_status_page);
 	DRM_DEBUG("hw status page @ %p\n", dev_priv->hw_status_page);
 
 	I915_WRITE(0x02080, dev_priv->dma_status_page);

-- 
Shani 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
