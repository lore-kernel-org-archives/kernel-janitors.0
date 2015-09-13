From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Sep 2015 12:15:25 +0000
Subject: [PATCH 32/39] drm: i915: drop null test before destroy functions
Message-Id: <1442146532-9100-33-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Vetter <daniel.vetter@intel.com>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>, David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

Remove unneeded NULL test.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression x; @@
-if (x != NULL)
  \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/gpu/drm/i915/i915_dma.c |   19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_dma.c b/drivers/gpu/drm/i915/i915_dma.c
index ab37d11..1dc7c21 100644
--- a/drivers/gpu/drm/i915/i915_dma.c
+++ b/drivers/gpu/drm/i915/i915_dma.c
@@ -1059,12 +1059,9 @@ out_freecsr:
 put_bridge:
 	pci_dev_put(dev_priv->bridge_dev);
 free_priv:
-	if (dev_priv->requests)
-		kmem_cache_destroy(dev_priv->requests);
-	if (dev_priv->vmas)
-		kmem_cache_destroy(dev_priv->vmas);
-	if (dev_priv->objects)
-		kmem_cache_destroy(dev_priv->objects);
+	kmem_cache_destroy(dev_priv->requests);
+	kmem_cache_destroy(dev_priv->vmas);
+	kmem_cache_destroy(dev_priv->objects);
 	kfree(dev_priv);
 	return ret;
 }
@@ -1150,13 +1147,9 @@ int i915_driver_unload(struct drm_device *dev)
 	if (dev_priv->regs != NULL)
 		pci_iounmap(dev->pdev, dev_priv->regs);
 
-	if (dev_priv->requests)
-		kmem_cache_destroy(dev_priv->requests);
-	if (dev_priv->vmas)
-		kmem_cache_destroy(dev_priv->vmas);
-	if (dev_priv->objects)
-		kmem_cache_destroy(dev_priv->objects);
-
+	kmem_cache_destroy(dev_priv->requests);
+	kmem_cache_destroy(dev_priv->vmas);
+	kmem_cache_destroy(dev_priv->objects);
 	pci_dev_put(dev_priv->bridge_dev);
 	kfree(dev_priv);
 

