From: Colin King <colin.king@canonical.com>
Date: Fri, 16 Nov 2018 15:06:33 +0000
Subject: [PATCH 2/5] ASoC: tlv320aic31xx: asihpi: clean up indentation, remove extraneous tab
Message-Id: <20181116150636.5226-2-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181116150636.5226-1-colin.king@canonical.com>
In-Reply-To: <20181116150636.5226-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Patrick Lai <plai@codeaurora.org>, Banajit Goswami <bgoswami@codeaurora.org>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The return statement is indented too much by one level, fix this by
removing an extraneous tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/tlv320aic31xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 608ad49ad978..c6048d95c6d3 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -1095,7 +1095,7 @@ static int aic31xx_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 	if (freq/i > 20000000) {
 		dev_err(aic31xx->dev, "%s: Too high mclk frequency %u\n",
 			__func__, freq);
-			return -EINVAL;
+		return -EINVAL;
 	}
 	aic31xx->p_div = i;
 
-- 
2.19.1
