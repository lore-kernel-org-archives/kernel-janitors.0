From: Colin King <colin.king@canonical.com>
Date: Fri, 18 May 2018 09:04:07 +0000
Subject: [PATCH] ASoC: wm8904: fix spelling mistake: "Caputure" -> "Capture"
Message-Id: <20180518090407.13560-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, patches@opensource.cirrus.com, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in SOC_ENUM literal string

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/wm8904.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 20fdcae06c6b..f13ef334c0d7 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -596,7 +596,7 @@ static const struct snd_kcontrol_new wm8904_adc_snd_controls[] = {
 SOC_DOUBLE_R_TLV("Digital Capture Volume", WM8904_ADC_DIGITAL_VOLUME_LEFT,
 		 WM8904_ADC_DIGITAL_VOLUME_RIGHT, 1, 119, 0, digital_tlv),
 
-SOC_ENUM("Left Caputure Mode", lin_mode),
+SOC_ENUM("Left Capture Mode", lin_mode),
 SOC_ENUM("Right Capture Mode", rin_mode),
 
 /* No TLV since it depends on mode */
-- 
2.17.0

