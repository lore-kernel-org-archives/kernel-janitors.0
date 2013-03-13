From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Mar 2013 05:32:53 +0000
Subject: [patch] ALSA: ASoC: tas5086: signedness bug in tas5086_hw_params()
Message-Id: <20130313053253.GA17674@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, devicetree-discuss@lists.ozlabs.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Daniel Mack <zonque@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, kbuild@01.org

"val" has to be signed for the error handling to work.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/codecs/tas5086.c b/sound/soc/codecs/tas5086.c
index 008bea4..41d03ae 100644
--- a/sound/soc/codecs/tas5086.c
+++ b/sound/soc/codecs/tas5086.c
@@ -251,7 +251,7 @@ static int tas5086_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_codec *codec = dai->codec;
 	struct tas5086_private *priv = snd_soc_codec_get_drvdata(codec);
-	unsigned int val;
+	int val;
 	int ret;
 
 	priv->rate = params_rate(params);
