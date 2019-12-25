From: Mark Brown <broonie@kernel.org>
Date: Wed, 25 Dec 2019 00:09:13 +0000
Subject: Applied "ASoC: SOF: imx8: fix memory allocation failure check on priv->pd_dev" to the asoc tree
Message-Id: <applied-20191204124816.1415359-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20191204124816.1415359-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Daniel Baluta <daniel.baluta@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org

The patch

   ASoC: SOF: imx8: fix memory allocation failure check on priv->pd_dev

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 98910e1d61384430a080b4bcf986c3b0cf3fdf46 Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 4 Dec 2019 12:48:16 +0000
Subject: [PATCH] ASoC: SOF: imx8: fix memory allocation failure check on
 priv->pd_dev

The memory allocation failure check for priv->pd_dev is incorrectly
pointer checking priv instead of priv->pd_dev. Fix this.

Addresses-Coverity: ("Logically dead code")
Fixes: 202acc565a1f ("ASoC: SOF: imx: Add i.MX8 HW support")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191204124816.1415359-1-colin.king@canonical.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/imx/imx8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index cfefcfd92798..9d926b1df0d7 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -209,7 +209,7 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 
 	priv->pd_dev = devm_kmalloc_array(&pdev->dev, priv->num_domains,
 					  sizeof(*priv->pd_dev), GFP_KERNEL);
-	if (!priv)
+	if (!priv->pd_dev)
 		return -ENOMEM;
 
 	priv->link = devm_kmalloc_array(&pdev->dev, priv->num_domains,
-- 
2.20.1
