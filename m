From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 22 Sep 2020 21:05:15 +0000
Subject: [PATCH] leds: lp50xx: Fix an error handling path in 'lp50xx_probe_dt()'
Message-Id: <20200922210515.385099-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pavel@ucw.cz, dmurphy@ti.com, jacek.anaszewski@gmail.com
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In case of memory allocation failure, we must release some resources as
done in all other error handling paths of the function.

'goto child_out' instead of a direct return so that 'fwnode_handle_put()'
is called when we break out of a 'device_for_each_child_node' loop.

Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/leds/leds-lp50xx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 47144a37cb94..8178782f2a8a 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -487,8 +487,10 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 		 */
 		mc_led_info = devm_kcalloc(priv->dev, LP50XX_LEDS_PER_MODULE,
 					   sizeof(*mc_led_info), GFP_KERNEL);
-		if (!mc_led_info)
-			return -ENOMEM;
+		if (!mc_led_info) {
+			ret = -ENOMEM;
+			goto child_out;
+		}
 
 		fwnode_for_each_child_node(child, led_node) {
 			ret = fwnode_property_read_u32(led_node, "color",
-- 
2.25.1
