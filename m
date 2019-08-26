From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 26 Aug 2019 13:18:55 +0000
Subject: [PATCH] ASoC: SOF: imx8: Fix an is IS_ERR() vs NULL check
Message-Id: <20190826131855.GA6840@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>

The device_link_add() function only returns NULL on error, it doesn't
return error pointers.

Fixes: 202acc565a1f ("ASoC: SOF: imx: Add i.MX8 HW support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/sof/imx/imx8.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index e502f584207f..41ad3a310808 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -227,8 +227,8 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 						DL_FLAG_STATELESS |
 						DL_FLAG_PM_RUNTIME |
 						DL_FLAG_RPM_ACTIVE);
-		if (IS_ERR(priv->link[i])) {
-			ret = PTR_ERR(priv->link[i]);
+		if (!priv->link[i]) {
+			ret = -ENOMEM;
 			dev_pm_domain_detach(priv->pd_dev[i], false);
 			goto exit_unroll_pm;
 		}
-- 
2.20.1
