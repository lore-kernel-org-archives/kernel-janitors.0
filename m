From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Jan 2021 09:50:21 +0000
Subject: [PATCH] ASoC: soc-pcm: Fix an uninitialized error code
Message-Id: <X/wfXQFxeMLvpO+1@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, =?utf-8?B?5pyx54G/54G/?= <zhucancan@vivo.com>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

The error path here doesn't set "ret" so it returns uninitialized data
instead of a negative error code.

Fixes: 2c1382840c19 ("ASoC: soc-pcm: disconnect BEs if the FE is not ready")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/soc-pcm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 481a4a25acb0..489697963dd3 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2443,6 +2443,7 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 		fe->dpcm[stream].state = SND_SOC_DPCM_STATE_CLOSE) {
 		dev_err(fe->dev, "ASoC: FE %s is not ready %d\n",
 			fe->dai_link->name, fe->dpcm[stream].state);
+		ret = -EINVAL;
 		goto disconnect;
 	}
 
-- 
2.29.2
