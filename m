From: Mark Brown <broonie@kernel.org>
Date: Tue, 14 Apr 2020 14:46:11 +0000
Subject: Applied "soc/stm/stm32_sub_sai: Add missing '\n' in log messages" to the asoc tree
Message-Id: <applied-20200413042952.7675-1-sebastian.fricke.linux@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200413042952.7675-1-sebastian.fricke.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Fricke <sebastian.fricke.linux@gmail.com>
Cc: alsa-devel@alsa-project.org, olivier.moysan@st.com, Alexandre Torgue <alexandre.torgue@st.com>, Arnaud Pouliquen <arnaud.pouliquen@st.com>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org

The patch

   soc/stm/stm32_sub_sai: Add missing '\n' in log messages

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

From 9de300abb71f24b190362ff53907ab90505517bc Mon Sep 17 00:00:00 2001
From: Sebastian Fricke <sebastian.fricke.linux@gmail.com>
Date: Mon, 13 Apr 2020 06:29:52 +0200
Subject: [PATCH] soc/stm/stm32_sub_sai: Add missing '\n' in log messages

Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.

Fixes: 3e086ed("ASoC: stm32: add SAI drivers")

Signed-off-by: Sebastian Fricke <sebastian.fricke.linux@gmail.com>
Link: https://lore.kernel.org/r/20200413042952.7675-1-sebastian.fricke.linux@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/stm/stm32_sai_sub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 0d0c9afd8791..34a7c3d6fb91 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -837,7 +837,7 @@ static int stm32_sai_set_config(struct snd_soc_dai *cpu_dai,
 		cr1 = SAI_XCR1_DS_SET(SAI_DATASIZE_32);
 		break;
 	default:
-		dev_err(cpu_dai->dev, "Data format not supported");
+		dev_err(cpu_dai->dev, "Data format not supported\n");
 		return -EINVAL;
 	}
 
-- 
2.20.1
