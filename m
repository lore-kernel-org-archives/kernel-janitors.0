From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Sep 2013 07:52:14 +0000
Subject: [patch] ASoC: max98095: a couple array underflows
Message-Id: <20130913075214.GB19211@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Bill Pemberton <wfp5p@virginia.edu>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

The ->put() function are called from snd_ctl_elem_write() with user
supplied data.  The limit checks here could underflow leading to a
crash.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index 41cdd16..8dbcacd 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -1863,7 +1863,7 @@ static int max98095_put_eq_enum(struct snd_kcontrol *kcontrol,
 	struct max98095_pdata *pdata = max98095->pdata;
 	int channel = max98095_get_eq_channel(kcontrol->id.name);
 	struct max98095_cdata *cdata;
-	int sel = ucontrol->value.integer.value[0];
+	unsigned int sel = ucontrol->value.integer.value[0];
 	struct max98095_eq_cfg *coef_set;
 	int fs, best, best_val, i;
 	int regmask, regsave;
@@ -2016,7 +2016,7 @@ static int max98095_put_bq_enum(struct snd_kcontrol *kcontrol,
 	struct max98095_pdata *pdata = max98095->pdata;
 	int channel = max98095_get_bq_channel(codec, kcontrol->id.name);
 	struct max98095_cdata *cdata;
-	int sel = ucontrol->value.integer.value[0];
+	unsigned int sel = ucontrol->value.integer.value[0];
 	struct max98095_biquad_cfg *coef_set;
 	int fs, best, best_val, i;
 	int regmask, regsave;
