From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 08:34:20 +0000
Subject: [PATCH 4/4] GPU-DRM-TILCDC: Delete unnecessary variable initialisations in tilcdc_convert_slave_node
Message-Id: <e44b638f-2d44-31ae-9c4f-65e711a57eba@users.sourceforge.net>
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
Date: Thu, 22 Sep 2016 10:15:36 +0200

Four local variables will be set to an appropriate pointer a bit later.
Thus omit the explicit initialisation which became unnecessary with
a previous update step.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
index 6ee5865..ae90728 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c
@@ -196,8 +196,7 @@ static const char * const tilcdc_slave_props[] __initconst = {
 
 void __init tilcdc_convert_slave_node(void)
 {
-	struct device_node *slave = NULL, *lcdc = NULL;
-	struct device_node *i2c = NULL, *fragment = NULL;
+	struct device_node *slave, *lcdc, *i2c, *fragment;
 	struct device_node *overlay, *encoder;
 	struct property *prop;
 	/* For all memory needed for the overlay tree. This memory can
-- 
2.10.0

