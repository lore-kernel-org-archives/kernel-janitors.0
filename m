From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Nov 2011 18:23:32 +0000
Subject: [patch] xen-gntdev: integer overflow in gntdev_alloc_map()
Message-Id: <20111104182332.GC5796@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>
Cc: kernel-janitors@vger.kernel.org, xen-devel@lists.xensource.com, virtualization@lists.linux-foundation.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

The multiplications here can overflow resulting in smaller buffer
sizes than expected.  "count" comes from a copy_from_user().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
index 880798a..2f3c363 100644
--- a/drivers/xen/gntdev.c
+++ b/drivers/xen/gntdev.c
@@ -114,11 +114,11 @@ static struct grant_map *gntdev_alloc_map(struct gntdev_priv *priv, int count)
 	if (NULL = add)
 		return NULL;
 
-	add->grants    = kzalloc(sizeof(add->grants[0])    * count, GFP_KERNEL);
-	add->map_ops   = kzalloc(sizeof(add->map_ops[0])   * count, GFP_KERNEL);
-	add->unmap_ops = kzalloc(sizeof(add->unmap_ops[0]) * count, GFP_KERNEL);
-	add->kmap_ops  = kzalloc(sizeof(add->kmap_ops[0])  * count, GFP_KERNEL);
-	add->pages     = kzalloc(sizeof(add->pages[0])     * count, GFP_KERNEL);
+	add->grants    = kcalloc(count, sizeof(add->grants[0]), GFP_KERNEL);
+	add->map_ops   = kcalloc(count, sizeof(add->map_ops[0]), GFP_KERNEL);
+	add->unmap_ops = kcalloc(count, sizeof(add->unmap_ops[0]), GFP_KERNEL);
+	add->kmap_ops  = kcalloc(count, sizeof(add->kmap_ops[0]), GFP_KERNEL);
+	add->pages     = kcalloc(count, sizeof(add->pages[0]), GFP_KERNEL);
 	if (NULL = add->grants    ||
 	    NULL = add->map_ops   ||
 	    NULL = add->unmap_ops ||
