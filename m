From: Shani Moideen <shani.moideen@wipro.com>
Date: Thu, 14 Jun 2007 11:15:17 +0000
Subject: [KJ] [KJ PATCH] Replacing memset(<addr>,0,PAGE_SIZE) with
Message-Id: <1181818997.2326.4.camel@shani-win>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1178621156.3598.10.camel@shani-win>
In-Reply-To: <1178621156.3598.10.camel@shani-win>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Replacing memset(<addr>,0,PAGE_SIZE) with clear_page(<addr>) 
in drivers/char/drm/i810_dma.c

Signed-off-by: Shani Moideen <shani.moideen@wipro.com>
----

diff --git a/drivers/char/drm/i810_dma.c b/drivers/char/drm/i810_dma.c
index 603d17f..4dbd97f 100644
--- a/drivers/char/drm/i810_dma.c
+++ b/drivers/char/drm/i810_dma.c
@@ -413,7 +413,7 @@ static int i810_dma_initialize(drm_device_t * dev,
 		DRM_ERROR("Can not allocate hardware status page\n");
 		return -ENOMEM;
 	}
-	memset(dev_priv->hw_status_page, 0, PAGE_SIZE);
+	clear_page(dev_priv->hw_status_page);
 	DRM_DEBUG("hw status page @ %p\n", dev_priv->hw_status_page);
 
 	I810_WRITE(0x02080, dev_priv->dma_status_page);

-- 
Shani 
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
