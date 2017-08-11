From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 11 Aug 2017 10:46:54 +0000
Subject: [PATCH] ASoC: Baytrail SST MAX98090: Delete an error message for a failed memory allocation in byt_m
Message-Id: <95614c7b-9856-94f8-4550-a87048cfe283@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 11 Aug 2017 12:42:40 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/intel/boards/byt-max98090.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/byt-max98090.c b/sound/soc/intel/boards/byt-max98090.c
index 047be7fa0ce9..fa68bb32adef 100644
--- a/sound/soc/intel/boards/byt-max98090.c
+++ b/sound/soc/intel/boards/byt-max98090.c
@@ -152,10 +152,8 @@ static int byt_max98090_probe(struct platform_device *pdev)
 	int ret_val;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_ATOMIC);
-	if (!priv) {
-		dev_err(&pdev->dev, "allocation failed\n");
+	if (!priv)
 		return -ENOMEM;
-	}
 
 	ret_val = devm_acpi_dev_add_driver_gpios(dev->parent, acpi_byt_max98090_gpios);
 	if (ret_val)
-- 
2.14.0

