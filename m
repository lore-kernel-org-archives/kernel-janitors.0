From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 11 Aug 2017 07:45:15 +0000
Subject: [PATCH] ASoC: kirkwood: Delete an error message for a failed memory allocation in kirkwood_i2s_dev_p
Message-Id: <2f32b2cf-dcde-ccef-24a5-f7b6ad9beb83@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 11 Aug 2017 09:35:33 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/kirkwood/kirkwood-i2s.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index 3b09f71b9535..105a73cc5158 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -538,10 +538,9 @@ static int kirkwood_i2s_dev_probe(struct platform_device *pdev)
 	int err;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv) {
-		dev_err(&pdev->dev, "allocation failed\n");
+	if (!priv)
 		return -ENOMEM;
-	}
+
 	dev_set_drvdata(&pdev->dev, priv);
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
2.14.0

