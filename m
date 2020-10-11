From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 11 Oct 2020 09:19:38 +0000
Subject: [PATCH 7/8] ASoC: madera: use semicolons rather than commas to separate statements
Message-Id: <1602407979-29038-8-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1602407979-29038-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1602407979-29038-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org

Replace commas with semicolons.  What is done is essentially described by
the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 sound/soc/codecs/madera.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 680f31a6493a..f4ed7e04673f 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -3019,11 +3019,11 @@ static int madera_hw_params_rate(struct snd_pcm_substream *substream,
 		tar = 2 << MADERA_AIF1_RATE_SHIFT;
 		break;
 	case MADERA_CLK_ASYNCCLK_1:
-		reg = MADERA_ASYNC_SAMPLE_RATE_1,
+		reg = MADERA_ASYNC_SAMPLE_RATE_1;
 		tar = 8 << MADERA_AIF1_RATE_SHIFT;
 		break;
 	case MADERA_CLK_ASYNCCLK_2:
-		reg = MADERA_ASYNC_SAMPLE_RATE_2,
+		reg = MADERA_ASYNC_SAMPLE_RATE_2;
 		tar = 9 << MADERA_AIF1_RATE_SHIFT;
 		break;
 	default:
