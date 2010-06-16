From: Christoph Fritz <chf.fritz@googlemail.com>
Date: Wed, 16 Jun 2010 14:54:52 +0000
Subject: [PATCH] drm/i915: fix warn, struct may be used uninitialized
Message-Id: <20100616145452.GA30948@lovely.krouter>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

In function ‘i915_setup_compression’:
warning: ‘compressed_llb’ may be used uninitialized in this function

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 drivers/gpu/drm/i915/i915_dma.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_dma.c b/drivers/gpu/drm/i915/i915_dma.c
index 59a2bf8..772a72a 100644
--- a/drivers/gpu/drm/i915/i915_dma.c
+++ b/drivers/gpu/drm/i915/i915_dma.c
@@ -1229,7 +1229,8 @@ static void i915_warn_stolen(struct drm_device *dev)
 static void i915_setup_compression(struct drm_device *dev, int size)
 {
 	struct drm_i915_private *dev_priv = dev->dev_private;
-	struct drm_mm_node *compressed_fb, *compressed_llb;
+	struct drm_mm_node *compressed_fb;
+	struct drm_mm_node *compressed_llb;
 	unsigned long cfb_base;
 	unsigned long ll_base = 0;
 
-- 
1.7.1

