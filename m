From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 22 Nov 2017 15:50:20 +0000
Subject: [PATCH 3/3] ASoC: cs42l73: Fix a typo in two comments
Message-Id: <a2278841-1791-0c00-af0a-7aa358a0d09d@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <609e2542-4750-fe60-4f42-08bca79bfb56@users.sourceforge.net>
In-Reply-To: <609e2542-4750-fe60-4f42-08bca79bfb56@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Brian Austin <brian.austin@cirrus.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Paul Handrigan <Paul.Handrigan@cirrus.com>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 22 Nov 2017 16:26:27 +0100

Add a missing character in these descriptions.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/codecs/cs42l73.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index dde37e569ade..928036eeb11f 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -763,7 +763,7 @@ static const struct snd_soc_dapm_route cs42l73_audio_map[] = {
 	{"ASPOUTL", "ASP-IP Volume", "ASPL Output Mixer"},
 	{"ASPOUTR", "ASP-IP Volume", "ASPR Output Mixer"},
 
-	/* Auxillary Capture */
+	/* Auxiliary Capture */
 	{"XSPL Output Mixer", NULL, "Input Left Capture"},
 	{"XSPR Output Mixer", NULL, "Input Right Capture"},
 
@@ -1127,9 +1127,8 @@ static int cs42l73_set_bias_level(struct snd_soc_codec *codec,
 			mdelay(cs42l73->shutdwn_delay);
 			cs42l73->shutdwn_delay = 0;
 		} else {
-			mdelay(15); /* Min amount of time requred to power
-				     * down.
-				     */
+			/* Min amount of time required to power down. */
+			mdelay(15);
 		}
 		snd_soc_update_bits(codec, CS42L73_DMMCC, CS42L73_MCLKDIS, 1);
 		break;
-- 
2.15.0

