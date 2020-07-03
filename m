From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 03 Jul 2020 03:09:10 +0000
Subject: [PATCH -next] ASoC: ti: j721e-evm: Fix missing unlock on error in j721e_audio_hw_params()
Message-Id: <20200703030910.75047-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Ujfalusi <peter.ujfalusi@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Add the missing unlock before return from function j721e_audio_hw_params()
in the error handling case.

Fixes: 6748d0559059 ("ASoC: ti: Add custom machine driver for j721e EVM (CPB and IVI)")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 sound/soc/ti/j721e-evm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/j721e-evm.c b/sound/soc/ti/j721e-evm.c
index 3a2a8b1f3aa3..174306cf53ad 100644
--- a/sound/soc/ti/j721e-evm.c
+++ b/sound/soc/ti/j721e-evm.c
@@ -330,7 +330,7 @@ static int j721e_audio_hw_params(struct snd_pcm_substream *substream,
 		ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x3, 0x3, 2,
 					       slot_width);
 		if (ret && ret != -ENOTSUPP)
-			return ret;
+			goto out;
 	}
 
 	ret = j721e_configure_refclk(priv, domain_id, params_rate(params));
