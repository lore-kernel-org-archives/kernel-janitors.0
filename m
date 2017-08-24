From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Aug 2017 10:07:41 +0000
Subject: [PATCH] ASoC: codecs: msm8916-wcd-analog: always true condition
Message-Id: <20170824100741.s4v24owbvocshr5n@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org, Axel Lin <axel.lin@ingics.com>, Damien Riegel <damien.riegel@savoirfairelinux.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Bhumika Goyal <bhumirks@gmail.com>

Static checkers complain that unsigned int val is always >= 0.  The
context is that snd_soc_read() returns -1U on error.  This is harmless
because we're checking that CDC_A_MBHC_RESULT_1_BTN_RESULT_MASK is not
set, and it will always be set for -1U.  I could have just removed the
check against -1 but I preserved it because I thought it helped with
readability.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
index 4aa878d29098..549c269acc7d 100644
--- a/sound/soc/codecs/msm8916-wcd-analog.c
+++ b/sound/soc/codecs/msm8916-wcd-analog.c
@@ -949,7 +949,7 @@ static irqreturn_t mbhc_btn_release_irq_handler(int irq, void *arg)
 		u32 val = snd_soc_read(codec, CDC_A_MBHC_RESULT_1);
 
 		/* check if its BTN0 thats released */
-		if ((val >= 0) && !(val & CDC_A_MBHC_RESULT_1_BTN_RESULT_MASK))
+		if ((val != -1) && !(val & CDC_A_MBHC_RESULT_1_BTN_RESULT_MASK))
 			priv->mbhc_btn0_pressed = false;
 
 	} else {
