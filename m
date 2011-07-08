From: Dan Carpenter <error27@gmail.com>
Date: Fri, 08 Jul 2011 07:23:17 +0000
Subject: [patch] Staging: gma500: reversed test in mdfld_dbi_dsr_exit()
Message-Id: <20110708072317.GT18655@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We should only cleanup "dsr_info" if it's non-NULL obviously and not
the other way around.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/gma500/mdfld_dsi_dbi.c b/drivers/staging/gma500/mdfld_dsi_dbi.c
index 9d2d97d..4897345 100644
--- a/drivers/staging/gma500/mdfld_dsi_dbi.c
+++ b/drivers/staging/gma500/mdfld_dsi_dbi.c
@@ -642,7 +642,7 @@ void mdfld_dbi_dsr_exit(struct drm_device *dev)
 	struct drm_psb_private *dev_priv = dev->dev_private;
 	struct mdfld_dbi_dsr_info *dsr_info = dev_priv->dbi_dsr_info;
 
-	if (!dsr_info) {
+	if (dsr_info) {
 		del_timer_sync(&dsr_info->dsr_timer);
 		kfree(dsr_info);
 		dev_priv->dbi_dsr_info = NULL;
