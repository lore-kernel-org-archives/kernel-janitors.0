From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 20 Sep 2016 08:58:59 +0000
Subject: [PATCH 3/6] GPU-DRM-GMA500: Move a variable assignment in mid_get_vbt_data_r10()
Message-Id: <0d7ea29b-a070-8cdf-d2fb-9e0c190f5d09@users.sourceforge.net>
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
Date: Tue, 20 Sep 2016 10:32:12 +0200

One local variable was set to an error code before a concrete
error situation was detected. Thus move the corresponding assignment into
an if branch to indicate a software failure there.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/gma500/mid_bios.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gma500/mid_bios.c b/drivers/gpu/drm/gma500/mid_bios.c
index cf4e605..3caee42 100644
--- a/drivers/gpu/drm/gma500/mid_bios.c
+++ b/drivers/gpu/drm/gma500/mid_bios.c
@@ -230,7 +230,7 @@ static int mid_get_vbt_data_r10(struct drm_psb_private *dev_priv, u32 addr)
 	struct gct_r10 *gct;
 	struct oaktrail_timing_info *dp_ti = &dev_priv->gct_data.DTD;
 	struct gct_r10_timing_info *ti;
-	int ret = -1;
+	int ret;
 
 	if (read_vbt_r10(addr, &vbt))
 		return -1;
@@ -241,8 +241,10 @@ static int mid_get_vbt_data_r10(struct drm_psb_private *dev_priv, u32 addr)
 
 	gct_virtual = ioremap(addr + sizeof(vbt),
 			sizeof(*gct) * vbt.panel_count);
-	if (!gct_virtual)
+	if (!gct_virtual) {
+		ret = -1;
 		goto free_gct;
+	}
 	memcpy_fromio(gct, gct_virtual, sizeof(*gct));
 	iounmap(gct_virtual);
 
-- 
2.10.0

