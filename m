From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sat, 13 Feb 2021 10:19:05 +0000
Subject: [PATCH 2/4] ASoC: mxs-saif: drop unneeded snd_soc_dai_set_drvdata
Message-Id: <20210213101907.1318496-3-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210213101907.1318496-1-Julia.Lawall@inria.fr>
In-Reply-To: <20210213101907.1318496-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org

snd_soc_dai_set_drvdata is not needed when the set data comes from
snd_soc_dai_get_drvdata or dev_get_drvdata.  The problem was fixed
usingthe following semantic patch: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression x,y,e;
@@
	x = dev_get_drvdata(y->dev)
	... when != x = e
-	snd_soc_dai_set_drvdata(y,x);

@@
expression x,y,e;
@@
	x = snd_soc_dai_get_drvdata(y)
	... when != x = e
-	snd_soc_dai_set_drvdata(y,x);
// </smpl>

In this case, the whole probe function then does nothing, so drop it.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 sound/soc/mxs/mxs-saif.c |   10 ----------
 1 file changed, 10 deletions(-)

diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index 07f8cf9980e3..6a2d24d48964 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -642,18 +642,8 @@ static const struct snd_soc_dai_ops mxs_saif_dai_ops = {
 	.set_fmt = mxs_saif_set_dai_fmt,
 };
 
-static int mxs_saif_dai_probe(struct snd_soc_dai *dai)
-{
-	struct mxs_saif *saif = dev_get_drvdata(dai->dev);
-
-	snd_soc_dai_set_drvdata(dai, saif);
-
-	return 0;
-}
-
 static struct snd_soc_dai_driver mxs_saif_dai = {
 	.name = "mxs-saif",
-	.probe = mxs_saif_dai_probe,
 	.playback = {
 		.channels_min = 2,
 		.channels_max = 2,
