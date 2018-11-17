From: Mark Brown <broonie@kernel.org>
Date: Sat, 17 Nov 2018 03:28:01 +0000
Subject: Applied "ASoC: arizona: fix indentation issue with return statement" to the asoc tree
Message-Id: <20181117032801.1096A440078@finisterre.ee.mobilebroadband>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181116150636.5226-4-colin.king@canonical.com>
In-Reply-To: <20181116150636.5226-4-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>, linux-kernel@vger.kernel.org, Patrick Lai <plai@codeaurora.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>

The patch

   ASoC: arizona: fix indentation issue with return statement

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

From 812fb75d977efb0257fe41700e6f8e04900ab27c Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 16 Nov 2018 15:06:35 +0000
Subject: [PATCH] ASoC: arizona: fix indentation issue with return statement

The return statement is indented incorrectly. Fix this by adding in
the missing tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8998.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8998.c b/sound/soc/codecs/wm8998.c
index 61294c787f27..409bed30a4e4 100644
--- a/sound/soc/codecs/wm8998.c
+++ b/sound/soc/codecs/wm8998.c
@@ -60,7 +60,7 @@ static int wm8998_asrc_ev(struct snd_soc_dapm_widget *w,
 				dev_warn(component->dev,
 					 "Unsupported ASRC rate1 (%s)\n",
 					 arizona_sample_rate_val_to_name(val));
-			return -EINVAL;
+				return -EINVAL;
 			}
 			break;
 		default:
-- 
2.19.1
