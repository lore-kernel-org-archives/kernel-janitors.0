From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sat, 13 Feb 2021 10:19:04 +0000
Subject: [PATCH 1/4] ASoC: mmp-sspa: drop unneeded snd_soc_dai_set_drvdata
Message-Id: <20210213101907.1318496-2-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210213101907.1318496-1-Julia.Lawall@inria.fr>
In-Reply-To: <20210213101907.1318496-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Mack <daniel@zonque.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Mark Brown <broonie@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, linux-arm-kernel@lists.infradead.org

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
 sound/soc/pxa/mmp-sspa.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index 4803972ee655..7e39210a0b38 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -330,7 +330,6 @@ static int mmp_sspa_probe(struct snd_soc_dai *dai)
 				&sspa->playback_dma_data,
 				&sspa->capture_dma_data);
 
-	snd_soc_dai_set_drvdata(dai, sspa);
 	return 0;
 }
 
