From: Emil Goode <emilgoode@gmail.com>
Date: Fri, 14 Jun 2013 09:48:56 +0000
Subject: [PATCH] ASoC: Fix double assignment of .owner in struct snd_soc_card
Message-Id: <1371203336-16972-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: eric.y.miao@gmail.com, linux@arm.linux.org.uk, haojian.zhuang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.de
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

In struct snd_soc_card zylonite .owner is assigned THIS_MODULE
twice, remove one of them.

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 sound/soc/pxa/zylonite.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/pxa/zylonite.c b/sound/soc/pxa/zylonite.c
index ceb6566..db8aadf 100644
--- a/sound/soc/pxa/zylonite.c
+++ b/sound/soc/pxa/zylonite.c
@@ -256,7 +256,6 @@ static struct snd_soc_card zylonite = {
 	.resume_pre = &zylonite_resume_pre,
 	.dai_link = zylonite_dai,
 	.num_links = ARRAY_SIZE(zylonite_dai),
-	.owner = THIS_MODULE,
 };
 
 static struct platform_device *zylonite_snd_ac97_device;
-- 
1.7.10.4

