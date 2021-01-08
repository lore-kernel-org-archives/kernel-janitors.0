From: Colin King <colin.king@canonical.com>
Date: Fri, 08 Jan 2021 12:35:46 +0000
Subject: [PATCH][next] ASoC: soc-pcm: Fix uninitialised return value in variable ret
Message-Id: <20210108123546.19601-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, =?UTF-8?q?=E6=9C=B1=E7=81=BF=E7=81=BF?= <zhucancan@vivo.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when attempting to start the BE fails because the
FE is not started the error return variable ret is not initialized
and garbage is returned.  Fix this by setting it to 0 so the
caller does not report the error "ASoC: failed to shutdown some BEs"
and because this failure path has already reported the reason for
the early return.

Addresses-Coverity: ("Uninitialized scalar variable")
Fixes: 2c1382840c19 ("ASoC: soc-pcm: disconnect BEs if the FE is not ready")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/soc-pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 481a4a25acb0..b787ce4ceb5a 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2443,6 +2443,7 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 		fe->dpcm[stream].state = SND_SOC_DPCM_STATE_CLOSE) {
 		dev_err(fe->dev, "ASoC: FE %s is not ready %d\n",
 			fe->dai_link->name, fe->dpcm[stream].state);
+		ret = 0;
 		goto disconnect;
 	}
 
-- 
2.29.2
