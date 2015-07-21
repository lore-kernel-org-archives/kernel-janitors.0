From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Jul 2015 08:55:27 +0000
Subject: [patch] ASoC: max98925: reading beyond the end of the array
Message-Id: <20150721085527.GA22070@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Anish Kumar <yesanishhere@gmail.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lars-Peter Clausen <lars@metafoo.de>, Axel Lin <axel.lin@ingics.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>

Debug prints are seldom useful and this one has an annoying thing where
it reads one space beyond the end of the array on error.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/codecs/max98925.c b/sound/soc/codecs/max98925.c
index e1753c8..ebb648a 100644
--- a/sound/soc/codecs/max98925.c
+++ b/sound/soc/codecs/max98925.c
@@ -271,8 +271,6 @@ static inline int max98925_rate_value(struct snd_soc_codec *codec,
 			break;
 		}
 	}
-	dev_dbg(codec->dev, "%s: sample rate is %d, returning %d\n",
-				__func__, rate_table[i].rate, *value);
 	return ret;
 }
 
