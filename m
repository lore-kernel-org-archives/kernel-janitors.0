From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 20 Sep 2016 08:55:53 +0000
Subject: [PATCH 1/6] GPU-DRM-GMA500: Use kmalloc_array() in mid_get_vbt_data_r10()
Message-Id: <fa298938-9e98-9f8e-524e-f43ebb2137ca@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <3c9785ef-4553-2e3d-2cb2-5cf6d1f31ccd@users.sourceforge.net>
In-Reply-To: <3c9785ef-4553-2e3d-2cb2-5cf6d1f31ccd@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 20 Sep 2016 08:54:07 +0200

A multiplication for the size determination of a memory allocation
indicated that an array data structure should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/gma500/mid_bios.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/mid_bios.c b/drivers/gpu/drm/gma500/mid_bios.c
index d75ecb3..a833568 100644
--- a/drivers/gpu/drm/gma500/mid_bios.c
+++ b/drivers/gpu/drm/gma500/mid_bios.c
@@ -235,7 +235,7 @@ static int mid_get_vbt_data_r10(struct drm_psb_private *dev_priv, u32 addr)
 	if (read_vbt_r10(addr, &vbt))
 		return -1;
 
-	gct = kmalloc(sizeof(*gct) * vbt.panel_count, GFP_KERNEL);
+	gct = kmalloc_array(vbt.panel_count, sizeof(*gct), GFP_KERNEL);
 	if (!gct)
 		return -1;
 
-- 
2.10.0

