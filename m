From: Christoph Fritz <chf.fritz@googlemail.com>
Date: Thu, 17 Jun 2010 13:27:29 +0000
Subject: Re: [PATCH] drm/i915: fix warn, struct may be used uninitialized
Message-Id: <1276781249.2999.0.camel@lovely.krouter>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100616145452.GA30948@lovely.krouter>
In-Reply-To: <20100616145452.GA30948@lovely.krouter>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

I meant to send the following patch.

Thanks for pointing out,
  chf

---
In function ‘i915_setup_compression’:
warning: ‘compressed_llb’ may be used uninitialized in this function

this modifies the topology of the function a bit

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 drivers/gpu/drm/i915/i915_dma.c |   15 ++++++---------
 1 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_dma.c b/drivers/gpu/drm/i915/i915_dma.c
index 59a2bf8..17b5dc8 100644
--- a/drivers/gpu/drm/i915/i915_dma.c
+++ b/drivers/gpu/drm/i915/i915_dma.c
@@ -1274,21 +1274,18 @@ static void i915_setup_compression(struct drm_device *dev, int size)
 			drm_mm_put_block(compressed_fb);
 			drm_mm_put_block(compressed_llb);
 		}
-	}
-
-	dev_priv->cfb_size = size;
 
-	intel_disable_fbc(dev);
-	dev_priv->compressed_fb = compressed_fb;
-
-	if (IS_GM45(dev)) {
-		I915_WRITE(DPFC_CB_BASE, compressed_fb->start);
-	} else {
 		I915_WRITE(FBC_CFB_BASE, cfb_base);
 		I915_WRITE(FBC_LL_BASE, ll_base);
 		dev_priv->compressed_llb = compressed_llb;
+	} else {
+		I915_WRITE(DPFC_CB_BASE, compressed_fb->start);
 	}
 
+	dev_priv->cfb_size = size;
+	intel_disable_fbc(dev);
+	dev_priv->compressed_fb = compressed_fb;
+
 	DRM_DEBUG("FBC base 0x%08lx, ll base 0x%08lx, size %dM\n", cfb_base,
 		  ll_base, size >> 20);
 }
-- 
1.7.1



