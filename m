From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 02 Nov 2018 15:00:18 +0000
Subject: [PATCH] ASoC: smd845: constify snd_soc_ops structure
Message-Id: <1541170818-24219-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Lai <plai@codeaurora.org>
Cc: kernel-janitors@vger.kernel.org, Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

The snd_soc_ops structure can be const as it is only stored in the
ops field of a snd_soc_dai_link structure and this field is const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 sound/soc/qcom/sdm845.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 9effbecc571f..8d0cdff64377 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -171,7 +171,7 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
 	}
 }
 
-static struct snd_soc_ops sdm845_be_ops = {
+static const struct snd_soc_ops sdm845_be_ops = {
 	.hw_params = sdm845_snd_hw_params,
 	.startup = sdm845_snd_startup,
 	.shutdown = sdm845_snd_shutdown,
