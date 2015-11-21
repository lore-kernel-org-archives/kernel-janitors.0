From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 21 Nov 2015 10:29:39 +0000
Subject: [patch] drm/vmwgfx: fix a warning message
Message-Id: <20151121102939.GB7002@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, kernel-janitors@vger.kernel.org, Jakob Bornecrantz <jakob@vmware.com>, dri-devel@lists.freedesktop.org, Brian Paul <brianp@vmware.com>, Charmaine Lee <charmainel@vmware.com>

The WARN_ON() macro only takes a condition argument, it doesn't take
a message.  I have converted this to WARN() instead.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
index a8baf5f..b6a0806 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
@@ -390,7 +390,7 @@ void *vmw_fifo_reserve_dx(struct vmw_private *dev_priv, uint32_t bytes,
 	else if (ctx_id = SVGA3D_INVALID_ID)
 		ret = vmw_local_fifo_reserve(dev_priv, bytes);
 	else {
-		WARN_ON("Command buffer has not been allocated.\n");
+		WARN(1, "Command buffer has not been allocated.\n");
 		ret = NULL;
 	}
 	if (IS_ERR_OR_NULL(ret)) {
