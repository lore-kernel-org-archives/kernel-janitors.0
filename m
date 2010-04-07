From: Dan Carpenter <error27@gmail.com>
Date: Wed, 07 Apr 2010 09:33:36 +0000
Subject: [patch] nouveau: fix memory leak
Message-Id: <20100407093336.GE5157@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Christoph Lameter <cl@linux-foundation.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia@diku.dk>, Ben Skeggs <bskeggs@redhat.com>, Tejun Heo <tj@kernel.org>, dri-devel@lists.sourceforge.net

In the original code there was a typo and we called kfree(pgraph->ctxprog)
two times instead of kfree(pgraph->ctxvals);

Also it's OK to pass NULL variables to kfree().  checkpatch.pl complains 
about this so I removed the checks.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/nouveau/nouveau_grctx.c b/drivers/gpu/drm/nouveau/nouveau_grctx.c
index 32f0e49..06642a5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_grctx.c
+++ b/drivers/gpu/drm/nouveau/nouveau_grctx.c
@@ -134,15 +134,11 @@ nouveau_grctx_fini(struct drm_device *dev)
 	struct drm_nouveau_private *dev_priv = dev->dev_private;
 	struct nouveau_pgraph_engine *pgraph = &dev_priv->engine.graph;
 
-	if (pgraph->ctxprog) {
-		kfree(pgraph->ctxprog);
-		pgraph->ctxprog = NULL;
-	}
+	kfree(pgraph->ctxprog);
+	pgraph->ctxprog = NULL;
 
-	if (pgraph->ctxvals) {
-		kfree(pgraph->ctxprog);
-		pgraph->ctxvals = NULL;
-	}
+	kfree(pgraph->ctxvals);
+	pgraph->ctxvals = NULL;
 }
 
 void
