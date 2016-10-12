From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2016 06:22:27 +0000
Subject: [patch] drm/savage: dereferencing an error pointer
Message-Id: <20161012062227.GU12841@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Markus Elfring <elfring@users.sourceforge.net>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

A recent cleanup changed the kmalloc() + copy_from_user() to
memdup_user() but the error handling wasn't updated so we might call
kfree(-EFAULT) and crash.

Fixes: a6e3918bcdb1 ('GPU-DRM-Savage: Use memdup_user() rather than duplicating')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/savage/savage_state.c b/drivers/gpu/drm/savage/savage_state.c
index 3dc0d8f..2db89be 100644
--- a/drivers/gpu/drm/savage/savage_state.c
+++ b/drivers/gpu/drm/savage/savage_state.c
@@ -1004,6 +1004,7 @@ int savage_bci_cmdbuf(struct drm_device *dev, void *data, struct drm_file *file_
 		kvb_addr = memdup_user(cmdbuf->vb_addr, cmdbuf->vb_size);
 		if (IS_ERR(kvb_addr)) {
 			ret = PTR_ERR(kvb_addr);
+			kvb_addr = NULL;
 			goto done;
 		}
 		cmdbuf->vb_addr = kvb_addr;
