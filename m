From: Colin King <colin.king@canonical.com>
Date: Wed, 22 Jan 2020 23:37:49 +0000
Subject: [PATCH] leds: lm3697: fix spelling mistake "To" -> "Too"
Message-Id: <20200122233749.2829246-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/leds/leds-lm3697.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index b71711aff8a3..872d26f9706a 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -246,7 +246,7 @@ static int lm3697_probe_dt(struct lm3697 *priv)
 
 		led->num_leds = fwnode_property_count_u32(child, "led-sources");
 		if (led->num_leds > LM3697_MAX_LED_STRINGS) {
-			dev_err(&priv->client->dev, "To many LED strings defined\n");
+			dev_err(&priv->client->dev, "Too many LED strings defined\n");
 			continue;
 		}
 
-- 
2.24.0
