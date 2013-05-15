From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 May 2013 07:12:25 +0000
Subject: [patch] drm/nvc0-/gr: bug widening a binary "not" operation
Message-Id: <20130515071225.GC20381@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org

"align" is u32 but info->addr and info->buffer[info->buffer_nr] are u64.
The "&= ~(align - 1)" operation clears the high bits accidentally.  I
have fixed this by using the ALIGN() macro.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.c b/drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.c
index 4cc6269..44b620b 100644
--- a/drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/graph/ctxnvc0.c
@@ -117,9 +117,7 @@ nvc0_grctx_init(struct nvc0_graph_priv *priv, struct nvc0_grctx *info)
 void
 nvc0_grctx_data(struct nvc0_grctx *info, u32 size, u32 align, u32 access)
 {
-	info->buffer[info->buffer_nr]  = info->addr;
-	info->buffer[info->buffer_nr] +=  (align - 1);
-	info->buffer[info->buffer_nr] &= ~(align - 1);
+	info->buffer[info->buffer_nr] = ALIGN(info->addr, align);
 	info->addr = info->buffer[info->buffer_nr++] + size;
 
 	info->data->size = size;
