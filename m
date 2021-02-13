From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sat, 13 Feb 2021 10:19:06 +0000
Subject: [PATCH 3/4] ASoC: sun4i-i2s: drop unneeded snd_soc_dai_set_drvdata
Message-Id: <20210213101907.1318496-4-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210213101907.1318496-1-Julia.Lawall@inria.fr>
In-Reply-To: <20210213101907.1318496-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org

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
 sound/soc/sunxi/sun4i-i2s.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 78506c3811dc..c57feae3396e 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1079,8 +1079,6 @@ static int sun4i_i2s_dai_probe(struct snd_soc_dai *dai)
 				  &i2s->playback_dma_data,
 				  &i2s->capture_dma_data);
 
-	snd_soc_dai_set_drvdata(dai, i2s);
-
 	return 0;
 }
 
