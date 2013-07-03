From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Jul 2013 09:38:26 +0000
Subject: [patch] drm/nvc0/gr: remove duplicate break statements
Message-Id: <20130703093826.GF1598@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

There are two break statements in a row.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.c b/drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.c
index 3be7b95..f1c0767 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.c
@@ -2249,7 +2249,6 @@ nvc0_grctx_generate_tp(struct nvc0_graph_priv *priv)
 		nv_wr32(priv, 0x419f54, 0x00000000);
 		nv_wr32(priv, 0x419f58, 0x00000000);
 		break;
-		break;
 	default:
 		BUG_ON(1);
 		break;
@@ -2321,7 +2320,6 @@ nvc0_grctx_generate(struct nvc0_graph_priv *priv)
 			}
 		}
 		break;
-		break;
 	case 0xc0:
 	case 0xc3:
 	case 0xc4:
