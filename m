From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 06 Feb 2018 21:24:30 +0000
Subject: [PATCH 2/2] drm/tilcdc: panel: Use common error handling code in of_get_panel_info()
Message-Id: <23b2cf6c-7b69-9ade-d97a-18af0c6eb73f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a7c7cebb-f4c9-04b7-5507-e41f8ebfb5f9@users.sourceforge.net>
In-Reply-To: <a7c7cebb-f4c9-04b7-5507-e41f8ebfb5f9@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 6 Feb 2018 22:10:11 +0100

Add a jump target so that a bit of exception handling can be better reused
at the end of this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/tilcdc/tilcdc_panel.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_panel.c b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
index 0b6aa95aec89..cf9ca16fee81 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_panel.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_panel.c
@@ -289,10 +289,8 @@ static struct tilcdc_panel_info *of_get_panel_info(struct device_node *np)
 	}
 
 	info = kzalloc(sizeof(*info), GFP_KERNEL);
-	if (!info) {
-		of_node_put(info_np);
-		return NULL;
-	}
+	if (!info)
+		goto put_node;
 
 	ret |= of_property_read_u32(info_np, "ac-bias", &info->ac_bias);
 	ret |= of_property_read_u32(info_np, "ac-bias-intrpt", &info->ac_bias_intrpt);
@@ -311,11 +309,11 @@ static struct tilcdc_panel_info *of_get_panel_info(struct device_node *np)
 	if (ret) {
 		pr_err("%s: error reading panel-info properties\n", __func__);
 		kfree(info);
-		of_node_put(info_np);
-		return NULL;
+		info = NULL;
 	}
-	of_node_put(info_np);
 
+put_node:
+	of_node_put(info_np);
 	return info;
 }
 
-- 
2.16.1

