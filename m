From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 10 Aug 2017 13:01:46 +0000
Subject: [PATCH 1/5] ASoC: dapm: Delete error messages for a failed memory allocation in snd_soc_dapm_new_pcm
Message-Id: <5742ec2a-2f88-717f-7286-aa0cac1bcb9c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e8013ddb-687d-ee56-8153-2791bb9f46fe@users.sourceforge.net>
In-Reply-To: <e8013ddb-687d-ee56-8153-2791bb9f46fe@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 10 Aug 2017 14:09:19 +0200

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/soc-dapm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index dcef67a9bd48..3adb914bc009 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3854,8 +3854,6 @@ int snd_soc_dapm_new_pcm(struct snd_soc_card *card,
 			(void *)(kcontrol_dai_link[0].private_value),
 			sizeof(struct soc_enum), GFP_KERNEL);
 	if (!private_value) {
-		dev_err(card->dev, "ASoC: Failed to create control for %s widget\n",
-			link_name);
 		ret = -ENOMEM;
 		goto outfree_link_name;
 	}
@@ -3866,8 +3864,6 @@ int snd_soc_dapm_new_pcm(struct snd_soc_card *card,
 					sizeof(struct snd_kcontrol_new),
 					GFP_KERNEL);
 	if (!template.kcontrol_news) {
-		dev_err(card->dev, "ASoC: Failed to create control for %s widget\n",
-			link_name);
 		ret = -ENOMEM;
 		goto outfree_private_value;
 	}
-- 
2.14.0

