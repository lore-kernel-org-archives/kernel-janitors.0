From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 12 Jul 2013 06:33:29 +0000
Subject: [patch] drm/nvc0-/gr: shift wrapping bug in nvc0_grctx_generate_r406800()
Message-Id: <20130712063329.GA29320@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

We care about the upper 32 bits here so we have to use 1ULL instead of 1
to avoid a shift wrapping bug.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.c b/drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.c
index 64dca26..fe67415 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.c
@@ -1039,7 +1039,7 @@ nvc0_grctx_generate_r406800(struct nvc0_graph_priv *priv)
 			} while (!tpcnr[gpc]);
 			tpc = priv->tpc_nr[gpc] - tpcnr[gpc]--;
 
-			tpc_set |= 1 << ((gpc * 8) + tpc);
+			tpc_set |= 1ULL << ((gpc * 8) + tpc);
 		}
 
 		nv_wr32(priv, 0x406800 + (i * 0x20), lower_32_bits(tpc_set));
