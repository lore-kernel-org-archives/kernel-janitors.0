From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 16 Jun 2012 13:19:27 +0000
Subject: [patch] ASoC: Ux500: unlock on an error path
Message-Id: <20120616131927.GB17980@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lrg@ti.com>
Cc: Ola Lilja <ola.o.lilja@stericsson.com>, alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org

There is a missing mutex_unlock() here.  The cleanup path also has more
debug output.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/codecs/ab8500-codec.c b/sound/soc/codecs/ab8500-codec.c
index 389dd66..3c79592 100644
--- a/sound/soc/codecs/ab8500-codec.c
+++ b/sound/soc/codecs/ab8500-codec.c
@@ -1235,7 +1235,8 @@ static int anc_status_control_put(struct snd_kcontrol *kcontrol,
 		req != ANC_APPLY_IIR) {
 		dev_err(dev, "%s: ERROR: Unsupported status to set '%s'!\n",
 			__func__, enum_anc_state[req]);
-		return -EINVAL;
+		status = -EINVAL;
+		goto cleanup;
 	}
 	apply_fir = req = ANC_APPLY_FIR || req = ANC_APPLY_FIR_IIR;
 	apply_iir = req = ANC_APPLY_IIR || req = ANC_APPLY_FIR_IIR;
