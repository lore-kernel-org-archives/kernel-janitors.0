From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 27 Apr 2017 09:12:08 +0000
Subject: [PATCH] drm/vmwgfx: Handle vmalloc() failure in vmw_local_fifo_reserve()
Message-Id: <20170427091208.mpdh2ldnolyusrpx@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: VMware Graphics <linux-graphics-maintainer@vmware.com>, Jakob Bornecrantz <jakob@vmware.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

If vmalloc() fails then we need to a bit of cleanup before returning.

Fixes: fb1d9738ca05 ("drm/vmwgfx: Add DRM driver for VMware Virtual GPU")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
index b6a0806b06bf..a1c68e6a689e 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c
@@ -368,6 +368,8 @@ static void *vmw_local_fifo_reserve(struct vmw_private *dev_priv,
 				return fifo_state->static_buffer;
 			else {
 				fifo_state->dynamic_buffer = vmalloc(bytes);
+				if (!fifo_state->dynamic_buffer)
+					goto out_err;
 				return fifo_state->dynamic_buffer;
 			}
 		}
