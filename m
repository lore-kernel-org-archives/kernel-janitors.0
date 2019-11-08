From: Colin King <colin.king@canonical.com>
Date: Fri, 08 Nov 2019 15:55:24 +0000
Subject: [PATCH][next] reset: npcm: check for NULL return from syscon_regmap_lookup_by_compat
Message-Id: <20191108155524.170566-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, openbmc@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Function syscon_regmap_lookup_by_compat can return a NULL pointer, so
the IS_ERR check on the return is incorrect. Fix this by checking for
IS_ERR_OR_NULL and return -ENODEV if true.  This avoids a null pointer
dereference on gcr_regmap later on.

Addresses-Coverity: ("Dereference null return (stat)")
Fixes: b3f1d036f26d ("reset: npcm: add NPCM reset controller driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/reset/reset-npcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
index 2ea4d3136e15..9febf8bed2f6 100644
--- a/drivers/reset/reset-npcm.c
+++ b/drivers/reset/reset-npcm.c
@@ -161,9 +161,9 @@ static int npcm_usb_reset(struct platform_device *pdev, struct npcm_rc_data *rc)
 	of_match_device(dev->driver->of_match_table, dev)->data;
 
 	gcr_regmap = syscon_regmap_lookup_by_compatible(gcr_dt);
-	if (IS_ERR(gcr_regmap)) {
+	if (IS_ERR_OR_NULL(gcr_regmap)) {
 		dev_err(&pdev->dev, "Failed to find %s\n", gcr_dt);
-		return PTR_ERR(gcr_regmap);
+		return -ENODEV;
 	}
 
 	/* checking which USB device is enabled */
-- 
2.20.1
