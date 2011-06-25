From: Dan Carpenter <error27@gmail.com>
Date: Sat, 25 Jun 2011 05:54:46 +0000
Subject: [patch] nouveau: error paths leak in nvc0_graph_construct_context()
Message-Id: <20110625055446.GT14591@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, Emil Velikov <emil.l.velikov@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>

Two of these error paths returned without freeing "ctx".

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/nouveau/nvc0_graph.c b/drivers/gpu/drm/nouveau/nvc0_graph.c
index 39e9208..5aa3f9e 100644
--- a/drivers/gpu/drm/nouveau/nvc0_graph.c
+++ b/drivers/gpu/drm/nouveau/nvc0_graph.c
@@ -106,7 +106,8 @@ nvc0_graph_construct_context(struct nouveau_channel *chan)
 		if (!nv_wait(dev, 0x409800, 0x80000000, 0x80000000)) {
 			NV_ERROR(dev, "PGRAPH: HUB_SET_CHAN timeout\n");
 			nvc0_graph_ctxctl_debug(dev);
-			return -EBUSY;
+			ret = -EBUSY;
+			goto err;
 		}
 	} else {
 		nvc0_graph_load_context(chan);
@@ -119,10 +120,9 @@ nvc0_graph_construct_context(struct nouveau_channel *chan)
 	}
 
 	ret = nvc0_grctx_generate(chan);
-	if (ret) {
-		kfree(ctx);
-		return ret;
-	}
+	if (ret)
+		goto err;
+
 
 	if (!nouveau_ctxfw) {
 		nv_wr32(dev, 0x409840, 0x80000000);
@@ -131,14 +131,13 @@ nvc0_graph_construct_context(struct nouveau_channel *chan)
 		if (!nv_wait(dev, 0x409800, 0x80000000, 0x80000000)) {
 			NV_ERROR(dev, "PGRAPH: HUB_CTX_SAVE timeout\n");
 			nvc0_graph_ctxctl_debug(dev);
-			return -EBUSY;
+			ret = -EBUSY;
+			goto err;
 		}
 	} else {
 		ret = nvc0_graph_unload_context_to(dev, chan->ramin->vinst);
-		if (ret) {
-			kfree(ctx);
-			return ret;
-		}
+		if (ret)
+			goto err;
 	}
 
 	for (i = 0; i < priv->grctx_size; i += 4)
@@ -146,6 +145,10 @@ nvc0_graph_construct_context(struct nouveau_channel *chan)
 
 	priv->grctx_vals = ctx;
 	return 0;
+
+err:
+	kfree(ctx);
+	return ret;
 }
 
 static int
