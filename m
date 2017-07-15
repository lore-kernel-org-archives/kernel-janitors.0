From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 15 Jul 2017 09:58:18 +0000
Subject: [PATCH 1/2 v2] leds: tlc591xx: merge conditional tests
Message-Id: <1500112699-770-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Purdie <rpurdie@rpsys.net>
Cc: kernel-janitors@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org

Merge conditionals that have the same then branch, to prepare for extending
that branch with of_node_put.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/leds/leds-tlc591xx.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-tlc591xx.c b/drivers/leds/leds-tlc591xx.c
index 30453164..fcc87ee 100644
--- a/drivers/leds/leds-tlc591xx.c
+++ b/drivers/leds/leds-tlc591xx.c
@@ -232,9 +232,8 @@ struct tlc591xx {
 		err = of_property_read_u32(child, "reg", &reg);
 		if (err)
 			return err;
-		if (reg < 0 || reg >= tlc591xx->max_leds)
-			return -EINVAL;
-		if (priv->leds[reg].active)
+		if (reg < 0 || reg >= tlc591xx->max_leds ||
+		    priv->leds[reg].active)
 			return -EINVAL;
 		priv->leds[reg].active = true;
 		priv->leds[reg].ldev.name 