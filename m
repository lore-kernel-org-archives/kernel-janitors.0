From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Aug 2016 19:45:24 +0000
Subject: [PATCH 1/2] GPU-DRM-Savage: Use memdup_user() rather than duplicating
Message-Id: <021efa32-c259-e799-a80e-630972291815@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <77052ac1-1933-49af-3ad8-6e0eecc1aafe@users.sourceforge.net>
In-Reply-To: <77052ac1-1933-49af-3ad8-6e0eecc1aafe@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 18 Aug 2016 18:12:03 +0200

Reuse existing functionality from memdup_user() instead of keeping
duplicate source code.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/savage/savage_state.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/savage/savage_state.c b/drivers/gpu/drm/savage/savage_state.c
index c01ad0a..3dc0d8f 100644
--- a/drivers/gpu/drm/savage/savage_state.c
+++ b/drivers/gpu/drm/savage/savage_state.c
@@ -1001,15 +1001,9 @@ int savage_bci_cmdbuf(struct drm_device *dev, void *data, struct drm_file *file_
 		cmdbuf->cmd_addr = kcmd_addr;
 	}
 	if (cmdbuf->vb_size) {
-		kvb_addr = kmalloc(cmdbuf->vb_size, GFP_KERNEL);
-		if (kvb_addr = NULL) {
-			ret = -ENOMEM;
-			goto done;
-		}
-
-		if (copy_from_user(kvb_addr, cmdbuf->vb_addr,
-				       cmdbuf->vb_size)) {
-			ret = -EFAULT;
+		kvb_addr = memdup_user(cmdbuf->vb_addr, cmdbuf->vb_size);
+		if (IS_ERR(kvb_addr)) {
+			ret = PTR_ERR(kvb_addr);
 			goto done;
 		}
 		cmdbuf->vb_addr = kvb_addr;
-- 
2.9.3

