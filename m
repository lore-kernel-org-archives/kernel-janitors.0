From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 11:16:42 +0000
Subject: [PATCH 2/3] HSI: omap_ssi: Fix a typo in a comment line
Message-Id: <61849261-123e-aa72-953e-dd5cc2bb4dc4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2fa2c33a-dc43-7e03-03d7-7ca04931e6c7@users.sourceforge.net>
In-Reply-To: <2fa2c33a-dc43-7e03-03d7-7ca04931e6c7@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Apr 2017 11:35:11 +0200

Add a missing character in this description for a function call.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hsi/controllers/omap_ssi_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hsi/controllers/omap_ssi_core.c b/drivers/hsi/controllers/omap_ssi_core.c
index 464db6d33afb..fb7ed8fce83a 100644
--- a/drivers/hsi/controllers/omap_ssi_core.c
+++ b/drivers/hsi/controllers/omap_ssi_core.c
@@ -467,7 +467,7 @@ static int ssi_hw_init(struct hsi_controller *ssi)
 		dev_err(&ssi->device, "runtime PM failed %d\n", err);
 		return err;
 	}
-	/* Reseting GDD */
+	/* Resetting GDD */
 	writel_relaxed(SSI_SWRESET, omap_ssi->gdd + SSI_GDD_GRST_REG);
 	/* Get FCK rate in KHz */
 	omap_ssi->fck_rate = DIV_ROUND_CLOSEST(ssi_get_clk_rate(ssi), 1000);
-- 
2.12.2

