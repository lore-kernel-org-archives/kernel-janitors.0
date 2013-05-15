From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 May 2013 07:09:43 +0000
Subject: [patch] ASoC: wm8994: missing break in wm8994_get_fll_config()
Message-Id: <20130515070943.GB20381@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, patches@opensource.wolfsonmicro.com, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>

Smatch complains that:

	sound/soc/codecs/wm8994.c:2087 wm8994_get_fll_config()
		warn: missing break? reassigning 'fll->k'

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 9f32dd8..303d755 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -2080,6 +2080,7 @@ static int wm8994_get_fll_config(struct wm8994 *control, struct fll_div *fll,
 		fll->k = K / 10;
 
 		pr_debug("N=%x K=%x\n", fll->n, fll->k);
+		break;
 
 	default:
 		gcd_fll = gcd(freq_out, freq_in);
