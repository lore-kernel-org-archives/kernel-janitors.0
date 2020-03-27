From: Mark Brown <broonie@kernel.org>
Date: Fri, 27 Mar 2020 17:28:45 +0000
Subject: Applied "ASoC: amd: acp3x-pcm-dma: clean up two indentation issues" to the asoc tree
Message-Id: <applied-20200327141429.269191-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200327141429.269191-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>

The patch

   ASoC: amd: acp3x-pcm-dma: clean up two indentation issues

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

From acd4946f5bf031fa38e64bfe2467be94a1b8c25d Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 27 Mar 2020 14:14:29 +0000
Subject: [PATCH] ASoC: amd: acp3x-pcm-dma: clean up two indentation issues

There are a couple of statements that are not indented correctly,
add in the missing tab and break the lines to address a checkpatch
warning.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Link: https://lore.kernel.org/r/20200327141429.269191-1-colin.king@canonical.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index d62c0d90c41e..e362f0bc9e46 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -458,7 +458,8 @@ static int acp3x_resume(struct device *dev)
 			reg_val = mmACP_I2STDM_ITER;
 			frmt_val = mmACP_I2STDM_TXFRMT;
 		}
-	rv_writel((rtd->xfer_resolution  << 3), rtd->acp3x_base + reg_val);
+		rv_writel((rtd->xfer_resolution  << 3),
+			  rtd->acp3x_base + reg_val);
 	}
 	if (adata->capture_stream && adata->capture_stream->runtime) {
 		struct i2s_stream_instance *rtd @@ -474,7 +475,8 @@ static int acp3x_resume(struct device *dev)
 			reg_val = mmACP_I2STDM_IRER;
 			frmt_val = mmACP_I2STDM_RXFRMT;
 		}
-	rv_writel((rtd->xfer_resolution  << 3), rtd->acp3x_base + reg_val);
+		rv_writel((rtd->xfer_resolution  << 3),
+			  rtd->acp3x_base + reg_val);
 	}
 	if (adata->tdm_mode = TDM_ENABLE) {
 		rv_writel(adata->tdm_fmt, adata->acp3x_base + frmt_val);
-- 
2.20.1
