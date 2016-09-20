From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 20 Sep 2016 08:59:56 +0000
Subject: [PATCH 4/6] GPU-DRM-GMA500: Fix indentation for a function call parameter in mid_get_vbt_data_r10()
Message-Id: <23719ce0-37c5-915d-7bb1-7668d9d74450@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <3c9785ef-4553-2e3d-2cb2-5cf6d1f31ccd@users.sourceforge.net>
In-Reply-To: <3c9785ef-4553-2e3d-2cb2-5cf6d1f31ccd@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 20 Sep 2016 10:34:28 +0200

Adjust the indentation for a single function call parameter here.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/gma500/mid_bios.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/mid_bios.c b/drivers/gpu/drm/gma500/mid_bios.c
index 3caee42..9004d30 100644
--- a/drivers/gpu/drm/gma500/mid_bios.c
+++ b/drivers/gpu/drm/gma500/mid_bios.c
@@ -240,7 +240,7 @@ static int mid_get_vbt_data_r10(struct drm_psb_private *dev_priv, u32 addr)
 		return -1;
 
 	gct_virtual = ioremap(addr + sizeof(vbt),
-			sizeof(*gct) * vbt.panel_count);
+			      sizeof(*gct) * vbt.panel_count);
 	if (!gct_virtual) {
 		ret = -1;
 		goto free_gct;
-- 
2.10.0

