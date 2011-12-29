From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 29 Dec 2011 16:51:28 +0000
Subject: [PATCH 2/10] sound/soc/au1x/dbdma2.c: use devm_ functions
Message-Id: <1325177489-13815-10-git-send-email-Julia.Lawall@lip6.fr>
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
 sound/soc/au1x/dbdma2.c |   14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/soc/au1x/dbdma2.c b/sound/soc/au1x/dbdma2.c
index 92bc1b0..8372cd3 100644
--- a/sound/soc/au1x/dbdma2.c
+++ b/sound/soc/au1x/dbdma2.c
@@ -350,27 +350,21 @@ static struct snd_soc_platform_driver au1xpsc_soc_platform = {
 static int __devinit au1xpsc_pcm_drvprobe(struct platform_device *pdev)
 {
 	struct au1xpsc_audio_dmadata *dmadata;
-	int ret;
 
-	dmadata = kzalloc(2 * sizeof(struct au1xpsc_audio_dmadata), GFP_KERNEL);
+	dmadata = devm_kzalloc(&pdev->dev,
+			       2 * sizeof(struct au1xpsc_audio_dmadata),
+			       GFP_KERNEL);
 	if (!dmadata)
 		return -ENOMEM;
 
 	platform_set_drvdata(pdev, dmadata);
 
-	ret = snd_soc_register_platform(&pdev->dev, &au1xpsc_soc_platform);
-	if (ret)
-		kfree(dmadata);
-
-	return ret;
+	return snd_soc_register_platform(&pdev->dev, &au1xpsc_soc_platform);
 }
 
 static int __devexit au1xpsc_pcm_drvremove(struct platform_device *pdev)
 {
-	struct au1xpsc_audio_dmadata *dmadata = platform_get_drvdata(pdev);
-
 	snd_soc_unregister_platform(&pdev->dev);
-	kfree(dmadata);
 
 	return 0;
 }

