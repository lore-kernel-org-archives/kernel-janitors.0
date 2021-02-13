From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sat, 13 Feb 2021 10:19:03 +0000
Subject: [PATCH 0/4] drop unneeded snd_soc_dai_set_drvdata
Message-Id: <20210213101907.1318496-1-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jernej Skrabec <jernej.skrabec@siol.net>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org

snd_soc_dai_set_drvdata is not needed when the set data comes from
snd_soc_dai_get_drvdata or dev_get_drvdata.  

---

 sound/soc/fsl/fsl_micfil.c  |    2 --
 sound/soc/fsl/fsl_sai.c     |    2 --
 sound/soc/fsl/fsl_xcvr.c    |    1 -
 sound/soc/mxs/mxs-saif.c    |   10 ----------
 sound/soc/pxa/mmp-sspa.c    |    1 -
 sound/soc/sunxi/sun4i-i2s.c |    2 --
 6 files changed, 18 deletions(-)
