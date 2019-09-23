From: Mark Brown <broonie@kernel.org>
Date: Mon, 23 Sep 2019 21:22:57 +0000
Subject: Applied "ASoC: soc-component: fix a couple missing error assignments" to the asoc tree
Message-Id: <20190923212257.D95BED02FCA@fitzroy.sirena.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20190923142257.GB31251@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>

The patch

   ASoC: soc-component: fix a couple missing error assignments

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 901e822b2e365dac4727e0ddffb444a2554b0a89 Mon Sep 17 00:00:00 2001
From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 Sep 2019 17:22:57 +0300
Subject: [PATCH] ASoC: soc-component: fix a couple missing error assignments

There were a couple places where the return value wasn't assigned so the
error handling wouldn't trigger.

Fixes: 5c0769af4caf ("ASoC: soc-dai: add snd_soc_dai_bespoke_trigger()")
Fixes: 95aef3553384 ("ASoC: soc-dai: add snd_soc_dai_trigger()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Link: https://lore.kernel.org/r/20190923142257.GB31251@mwanda
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-pcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index e163dde5eab1..a1b99ac57d9e 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1070,7 +1070,7 @@ static int soc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 			return ret;
 	}
 
-	snd_soc_dai_trigger(cpu_dai, substream, cmd);
+	ret = snd_soc_dai_trigger(cpu_dai, substream, cmd);
 	if (ret < 0)
 		return ret;
 
@@ -1097,7 +1097,7 @@ static int soc_pcm_bespoke_trigger(struct snd_pcm_substream *substream,
 			return ret;
 	}
 
-	snd_soc_dai_bespoke_trigger(cpu_dai, substream, cmd);
+	ret = snd_soc_dai_bespoke_trigger(cpu_dai, substream, cmd);
 	if (ret < 0)
 		return ret;
 
-- 
2.20.1
