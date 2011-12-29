From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 29 Dec 2011 16:51:20 +0000
Subject: [PATCH 10/10] sound/soc/davinci/davinci-vcif.c: use devm_ functions
Message-Id: <1325177489-13815-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1325177489-13815-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1325177489-13815-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lrg@ti.com>
Cc: kernel-janitors@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Julia Lawall <julia.lawall@lip6.fr>

The various devm_ functions allocate memory that is released when a driver
detaches.  This patch uses devm_kzalloc, devm_request_mem_region and
devm_ioremap for data that is allocated in the probe function of a platform
device and is only freed in the remove function.

Signed-off-by: Julia Lawall <julia.lawall@lip6.fr>

---
 sound/soc/davinci/davinci-vcif.c |   14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/soc/davinci/davinci-vcif.c b/sound/soc/davinci/davinci-vcif.c
index 70ce10c..da030ff 100644
--- a/sound/soc/davinci/davinci-vcif.c
+++ b/sound/soc/davinci/davinci-vcif.c
@@ -210,7 +210,9 @@ static int davinci_vcif_probe(struct platform_device *pdev)
 	struct davinci_vcif_dev *davinci_vcif_dev;
 	int ret;
 
-	davinci_vcif_dev = kzalloc(sizeof(struct davinci_vcif_dev), GFP_KERNEL);
+	davinci_vcif_dev = devm_kzalloc(&pdev->dev,
+					sizeof(struct davinci_vcif_dev),
+					GFP_KERNEL);
 	if (!davinci_vcif_dev) {
 		dev_dbg(&pdev->dev,
 			"could not allocate memory for private data\n");
@@ -235,23 +237,15 @@ static int davinci_vcif_probe(struct platform_device *pdev)
 	ret = snd_soc_register_dai(&pdev->dev, &davinci_vcif_dai);
 	if (ret != 0) {
 		dev_err(&pdev->dev, "could not register dai\n");
-		goto fail;
+		return ret;
 	}
 
 	return 0;
-
-fail:
-	kfree(davinci_vcif_dev);
-
-	return ret;
 }
 
 static int davinci_vcif_remove(struct platform_device *pdev)
 {
-	struct davinci_vcif_dev *davinci_vcif_dev = dev_get_drvdata(&pdev->dev);
-
 	snd_soc_unregister_dai(&pdev->dev);
-	kfree(davinci_vcif_dev);
 
 	return 0;
 }

