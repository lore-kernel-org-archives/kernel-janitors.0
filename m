From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Sep 2018 08:40:48 +0000
Subject: [PATCH] ASoC: qdsp6: q6asm-dai: clean up a return
Message-Id: <20180910084048.uhgbbsasp25czuud@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Lai <plai@codeaurora.org>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>

Smatch complains that if both "psubstream" and "csubstream" are NULL
then "ret" is uninitialized.  That probably can't happen, but it's
cleaner to just return zero anyway so let's do that.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 9db9a2944ef2..c75fab38905d 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -493,7 +493,7 @@ static int q6asm_dai_pcm_new(struct snd_soc_pcm_runtime *rtd)
 		}
 	}
 
-	return ret;
+	return 0;
 }
 
 static void q6asm_dai_pcm_free(struct snd_pcm *pcm)
