From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 08:32:42 +0000
Subject: [PATCH 2/4] GPU-DRM-TILCDC: Return directly after a failed kfree_table_init() in tilcdc_convert_slav
Message-Id: <e74ecf81-1ddc-2583-3a4b-48735e2898c4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <2f3f7ad7-16a0-1dfb-d073-0d993cd767ee@users.sourceforge.net>
In-Reply-To: <2f3f7ad7-16a0-1dfb-d073-0d993cd767ee@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 09:29:23 +0200

Return directly after a memory allocation failed in this function
at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
index 8faa28f..6204405 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
@@ -206,7 +206,7 @@ void __init tilcdc_convert_slave_node(void)
 	int ret;
 
 	if (kfree_table_init(&kft))
-		goto out;
+		return;
 
 	lcdc = of_find_matching_node(NULL, tilcdc_of_match);
 	slave = of_find_matching_node(NULL, tilcdc_slave_of_match);
-- 
2.10.0

