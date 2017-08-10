From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 10 Aug 2017 08:07:36 +0000
Subject: [PATCH] ASoC: spear: Delete an error message for a failed memory allocation in two functions
Message-Id: <1e377ebe-822c-fca6-d2cd-c27a84ae1566@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 10 Aug 2017 09:50:51 +0200

Omit an extra message for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/spear/spdif_in.c  | 4 +---
 sound/soc/spear/spdif_out.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/spear/spdif_in.c b/sound/soc/spear/spdif_in.c
index 7f32527fc3c8..01b28e59b4c0 100644
--- a/sound/soc/spear/spdif_in.c
+++ b/sound/soc/spear/spdif_in.c
@@ -216,10 +216,8 @@ static int spdif_in_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
-	if (!host) {
-		dev_warn(&pdev->dev, "kzalloc fail\n");
+	if (!host)
 		return -ENOMEM;
-	}
 
 	host->io_base = io_base;
 	host->irq = platform_get_irq(pdev, 0);
diff --git a/sound/soc/spear/spdif_out.c b/sound/soc/spear/spdif_out.c
index 0a72d52d533e..58d5843811f9 100644
--- a/sound/soc/spear/spdif_out.c
+++ b/sound/soc/spear/spdif_out.c
@@ -282,10 +282,8 @@ static int spdif_out_probe(struct platform_device *pdev)
 	int ret;
 
 	host = devm_kzalloc(&pdev->dev, sizeof(*host), GFP_KERNEL);
-	if (!host) {
-		dev_warn(&pdev->dev, "kzalloc fail\n");
+	if (!host)
 		return -ENOMEM;
-	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	host->io_base = devm_ioremap_resource(&pdev->dev, res);
-- 
2.13.4

