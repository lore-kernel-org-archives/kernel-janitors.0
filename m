From: Mark Brown <broonie@kernel.org>
Date: Fri, 17 Jan 2020 15:44:12 +0000
Subject: Applied "ASoC: rt700: fix return value check in rt700_sdw_probe()" to the asoc tree
Message-Id: <applied-20200115143027.94364-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200115143027.94364-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Shuming Fan <shumingf@realtek.com>, Bard Liao <bardliao@realtek.com>

The patch

   ASoC: rt700: fix return value check in rt700_sdw_probe()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 20435df1c1d708b44f58da17653f2ea609aee790 Mon Sep 17 00:00:00 2001
From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 15 Jan 2020 14:30:27 +0000
Subject: [PATCH] ASoC: rt700: fix return value check in rt700_sdw_probe()

In case of error, the function devm_regmap_init() returns ERR_PTR() and
never returns NULL. The NULL test in the return value check should be
replaced with IS_ERR().

Fixes: 7d2a5f9ae41e ("ASoC: rt700: add rt700 codec driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Link: https://lore.kernel.org/r/20200115143027.94364-1-weiyongjun1@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt700-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 314103601af3..a4b95425886f 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -460,8 +460,8 @@ static int rt700_sdw_probe(struct sdw_slave *slave,
 
 	regmap = devm_regmap_init(&slave->dev, NULL,
 		&slave->dev, &rt700_regmap);
-	if (!regmap)
-		return -EINVAL;
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
 
 	rt700_init(&slave->dev, sdw_regmap, regmap, slave);
 
-- 
2.20.1
