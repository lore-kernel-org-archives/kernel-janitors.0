From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Dec 2020 06:54:51 +0000
Subject: [PATCH] ASoC: max98390: Fix error codes in max98390_dsm_init()
Message-Id: <X9B0uz4svyNTqeMb@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Steve Lee <steves.lee@maximintegrated.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>

These error paths return success but they should return -EINVAL.

Fixes: 97ed3e509ee6 ("ASoC: max98390: Fix potential crash during param fw loading")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/codecs/max98390.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index ff5cc9bbec29..bb736c44e68a 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -784,6 +784,7 @@ static int max98390_dsm_init(struct snd_soc_component *component)
 	if (fw->size < MAX98390_DSM_PARAM_MIN_SIZE) {
 		dev_err(component->dev,
 			"param fw is invalid.\n");
+		ret = -EINVAL;
 		goto err_alloc;
 	}
 	dsm_param = (char *)fw->data;
@@ -794,6 +795,7 @@ static int max98390_dsm_init(struct snd_soc_component *component)
 		fw->size < param_size + MAX98390_DSM_PAYLOAD_OFFSET) {
 		dev_err(component->dev,
 			"param fw is invalid.\n");
+		ret = -EINVAL;
 		goto err_alloc;
 	}
 	regmap_write(max98390->regmap, MAX98390_R203A_AMP_EN, 0x80);
-- 
2.29.2
