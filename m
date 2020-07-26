From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 26 Jul 2020 08:25:33 +0000
Subject: [PATCH] ASoC: SOF: imx: use resource_size
Message-Id: <1595751933-4952-1-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org

Use resource_size rather than a verbose computation on
the end and start fields.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

<smpl>
@@ struct resource ptr; @@
- (ptr.end - ptr.start + 1)
+ resource_size(&ptr)
</smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 sound/soc/sof/imx/imx8m.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -u -p a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -188,8 +188,7 @@ static int imx8m_probe(struct snd_sof_de
 	}
 
 	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap_wc(sdev->dev, res.start,
-							  res.end - res.start +
-							  1);
+							  resource_size(&res));
 	if (!sdev->bar[SOF_FW_BLK_TYPE_SRAM]) {
 		dev_err(sdev->dev, "failed to ioremap mem 0x%x size 0x%x\n",
 			base, size);
