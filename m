From: Mark Brown <broonie@kernel.org>
Date: Fri, 18 Oct 2019 18:06:58 +0000
Subject: Applied "ASoC: rt1011: fix spelling mistake "temperture" -> "temperature"" to the asoc tree
Message-Id: <20191018180658.A66102743259@ypsilon.sirena.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20191018082317.11971-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, Bard Liao <bardliao@realtek.com>

The patch

   ASoC: rt1011: fix spelling mistake "temperture" -> "temperature"

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 349959a9c767cee04b7362fda230cc2433246fd9 Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 18 Oct 2019 09:23:17 +0100
Subject: [PATCH] ASoC: rt1011: fix spelling mistake "temperture" ->
 "temperature"

There is a spelling mistake in a dev_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Link: https://lore.kernel.org/r/20191018082317.11971-1-colin.king@canonical.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt1011.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index ad049cfddcb0..dcd397a83cb4 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -2373,7 +2373,7 @@ static int rt1011_parse_dp(struct rt1011_priv *rt1011, struct device *dev)
 	device_property_read_u32(dev, "realtek,r0_calib",
 		&rt1011->r0_calib);
 
-	dev_dbg(dev, "%s: r0_calib: 0x%x, temperture_calib: 0x%x",
+	dev_dbg(dev, "%s: r0_calib: 0x%x, temperature_calib: 0x%x",
 		__func__, rt1011->r0_calib, rt1011->temperature_calib);
 
 	return 0;
-- 
2.20.1
