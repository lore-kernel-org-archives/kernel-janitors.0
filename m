From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sat, 13 Feb 2021 10:19:07 +0000
Subject: [PATCH 4/4] ASoC: fsl: drop unneeded snd_soc_dai_set_drvdata
Message-Id: <20210213101907.1318496-5-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210213101907.1318496-1-Julia.Lawall@inria.fr>
In-Reply-To: <20210213101907.1318496-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Timur Tabi <timur@kernel.org>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org

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

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 sound/soc/fsl/fsl_micfil.c |    2 --
 sound/soc/fsl/fsl_sai.c    |    2 --
 sound/soc/fsl/fsl_xcvr.c   |    1 -
 3 files changed, 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 8aedf6590b28..fd21017fa2bd 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -423,8 +423,6 @@ static int fsl_micfil_dai_probe(struct snd_soc_dai *cpu_dai)
 		return ret;
 	}
 
-	snd_soc_dai_set_drvdata(cpu_dai, micfil);
-
 	return 0;
 }
 
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 5e65b456d3e2..8876d0ed37d9 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -727,8 +727,6 @@ static int fsl_sai_dai_probe(struct snd_soc_dai *cpu_dai)
 	snd_soc_dai_init_dma_data(cpu_dai, &sai->dma_params_tx,
 				&sai->dma_params_rx);
 
-	snd_soc_dai_set_drvdata(cpu_dai, sai);
-
 	return 0;
 }
 
diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index dd228b421e2c..8a3bde718697 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -869,7 +869,6 @@ static int fsl_xcvr_dai_probe(struct snd_soc_dai *dai)
 	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
 
 	snd_soc_dai_init_dma_data(dai, &xcvr->dma_prms_tx, &xcvr->dma_prms_rx);
-	snd_soc_dai_set_drvdata(dai, xcvr);
 
 	snd_soc_add_dai_controls(dai, &fsl_xcvr_mode_kctl, 1);
 	snd_soc_add_dai_controls(dai, &fsl_xcvr_arc_mode_kctl, 1);
