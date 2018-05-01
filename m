From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 May 2018 21:08:10 +0000
Subject: Applied "ASoC: amd: fix spelling mistake: "failer" -> "failure"" to the asoc tree
Message-Id: <20180501210810.A6CD044007A@finisterre.ee.mobilebroadband>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180501082001.21904-1-colin.king@canonical.com>
In-Reply-To: <20180501082001.21904-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Alex Deucher <alexander.deucher@amd.com>

The patch

   ASoC: amd: fix spelling mistake: "failer" -> "failure"

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

From 9e6a469ec7dabc73043522d21e634583d91cb567 Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 1 May 2018 09:20:01 +0100
Subject: [PATCH] ASoC: amd: fix spelling mistake: "failer" -> "failure"

Trivial fix to spelling mistake in dev_err error message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/amd/acp-pcm-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/acp-pcm-dma.c b/sound/soc/amd/acp-pcm-dma.c
index 9c026c4d26d4..2b9a020e0b3e 100644
--- a/sound/soc/amd/acp-pcm-dma.c
+++ b/sound/soc/amd/acp-pcm-dma.c
@@ -1014,7 +1014,7 @@ static int acp_dma_new(struct snd_soc_pcm_runtime *rtd)
 	}
 	if (ret < 0)
 		dev_err(component->dev,
-			"buffer preallocation failer error:%d\n", ret);
+			"buffer preallocation failure error:%d\n", ret);
 	return ret;
 }
 
-- 
2.17.0

