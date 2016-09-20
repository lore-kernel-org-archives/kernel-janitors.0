From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 20 Sep 2016 08:57:37 +0000
Subject: [PATCH 2/6] GPU-DRM-GMA500: Rename a jump label in mid_get_vbt_data_r10()
Message-Id: <29c651f1-8527-0f65-0b60-3503808c9d6d@users.sourceforge.net>
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
Date: Tue, 20 Sep 2016 09:09:10 +0200

Adjust a jump label according to the current Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/gma500/mid_bios.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gma500/mid_bios.c b/drivers/gpu/drm/gma500/mid_bios.c
index a833568..cf4e605 100644
--- a/drivers/gpu/drm/gma500/mid_bios.c
+++ b/drivers/gpu/drm/gma500/mid_bios.c
@@ -242,7 +242,7 @@ static int mid_get_vbt_data_r10(struct drm_psb_private *dev_priv, u32 addr)
 	gct_virtual = ioremap(addr + sizeof(vbt),
 			sizeof(*gct) * vbt.panel_count);
 	if (!gct_virtual)
-		goto out;
+		goto free_gct;
 	memcpy_fromio(gct, gct_virtual, sizeof(*gct));
 	iounmap(gct_virtual);
 
@@ -270,7 +270,7 @@ static int mid_get_vbt_data_r10(struct drm_psb_private *dev_priv, u32 addr)
 	dp_ti->vsync_pulse_width_lo = ti->vsync_pulse_width_lo;
 
 	ret = 0;
-out:
+ free_gct:
 	kfree(gct);
 	return ret;
 }
-- 
2.10.0

