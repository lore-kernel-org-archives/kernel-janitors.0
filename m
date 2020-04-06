From: Mark Brown <broonie@kernel.org>
Date: Mon, 06 Apr 2020 14:03:46 +0000
Subject: Applied "ASoC: stm32: sai: Add missing cleanup" to the asoc tree
Message-Id: <applied-1586099028-5104-1-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <1586099028-5104-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: alsa-devel@alsa-project.org, Olivier Moysan <olivier.moysan@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org

The patch

   ASoC: stm32: sai: Add missing cleanup

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

From 7506baeed8d05fc164254c64af14cfed2ac14446 Mon Sep 17 00:00:00 2001
From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 5 Apr 2020 17:03:48 +0200
Subject: [PATCH] ASoC: stm32: sai: Add missing cleanup

The commit 0d6defc7e0e4 ("ASoC: stm32: sai: manage rebind issue")
converts some function calls to their non-devm equivalents.  The
appropriate cleanup code was added to the remove function, but not
to the probe function.  Add a call to snd_dmaengine_pcm_unregister
to compensate for the call to snd_dmaengine_pcm_register in case
of subsequent failure.

Fixes: commit 0d6defc7e0e4 ("ASoC: stm32: sai: manage rebind issue")
Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Acked-by: Olivier Moysan <olivier.moysan@st.com>
Link: https://lore.kernel.org/r/1586099028-5104-1-git-send-email-Julia.Lawall@inria.fr
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/stm/stm32_sai_sub.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 2bd280c01c33..0d0c9afd8791 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1556,8 +1556,10 @@ static int stm32_sai_sub_probe(struct platform_device *pdev)
 
 	ret = snd_soc_register_component(&pdev->dev, &stm32_component,
 					 &sai->cpu_dai_drv, 1);
-	if (ret)
+	if (ret) {
+		snd_dmaengine_pcm_unregister(&pdev->dev);
 		return ret;
+	}
 
 	if (STM_SAI_PROTOCOL_IS_SPDIF(sai))
 		conf = &stm32_sai_pcm_config_spdif;
-- 
2.20.1
