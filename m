From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Dec 2018 09:05:16 +0000
Subject: [PATCH 2/2] ASoC: qdsp6: q6asm-dai: Fix a NULL vs IS_ERR() bug
Message-Id: <20181221090516.GB2735@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181221090442.GA2735@kadam>
In-Reply-To: <20181221090442.GA2735@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Lai <plai@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>

The q6asm_audio_client_alloc() doesn't return NULL, it returns error
pointers.

Fixes: 22930c79ac5c ("ASoC: qdsp6: q6asm-dai: Add support to compress offload")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 9d738b4c1e05..3407e51b8861 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -570,10 +570,11 @@ static int q6asm_dai_compr_open(struct snd_compr_stream *stream)
 	prtd->audio_client = q6asm_audio_client_alloc(dev,
 					(q6asm_cb)compress_event_handler,
 					prtd, stream_id, LEGACY_PCM_MODE);
-	if (!prtd->audio_client) {
+	if (IS_ERR(prtd->audio_client)) {
 		dev_err(dev, "Could not allocate memory\n");
+		ret = PTR_ERR(prtd->audio_client);
 		kfree(prtd);
-		return -ENOMEM;
+		return ret;
 	}
 
 	size = COMPR_PLAYBACK_MAX_FRAGMENT_SIZE *
-- 
2.17.1
