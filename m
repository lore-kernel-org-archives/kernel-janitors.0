From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 09 Dec 2020 19:42:02 +0000
Subject: [PATCH] mmc: owl-mmc: Fix a resource leak in an error handling path and in the remove function
Message-Id: <20201209194202.54099-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ulf.hansson@linaro.org, afaerber@suse.de, manivannan.sadhasivam@linaro.org
Cc: kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

'dma_request_chan()' calls should be balanced by a corresponding
'dma_release_channel()' call.

Add the missing call both in the error handling path of the probe function
and in the remove function.

Fixes: ff65ffe46d28 ("mmc: Add Actions Semi Owl SoCs SD/MMC driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mmc/host/owl-mmc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/owl-mmc.c b/drivers/mmc/host/owl-mmc.c
index 53b81582f1af..5490962dc8e5 100644
--- a/drivers/mmc/host/owl-mmc.c
+++ b/drivers/mmc/host/owl-mmc.c
@@ -640,7 +640,7 @@ static int owl_mmc_probe(struct platform_device *pdev)
 	owl_host->irq = platform_get_irq(pdev, 0);
 	if (owl_host->irq < 0) {
 		ret = -EINVAL;
-		goto err_free_host;
+		goto err_release_channel;
 	}
 
 	ret = devm_request_irq(&pdev->dev, owl_host->irq, owl_irq_handler,
@@ -648,19 +648,21 @@ static int owl_mmc_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to request irq %d\n",
 			owl_host->irq);
-		goto err_free_host;
+		goto err_release_channel;
 	}
 
 	ret = mmc_add_host(mmc);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to add host\n");
-		goto err_free_host;
+		goto err_release_channel;
 	}
 
 	dev_dbg(&pdev->dev, "Owl MMC Controller Initialized\n");
 
 	return 0;
 
+err_release_channel:
+	dma_release_channel(owl_host->dma);
 err_free_host:
 	mmc_free_host(mmc);
 
@@ -674,6 +676,7 @@ static int owl_mmc_remove(struct platform_device *pdev)
 
 	mmc_remove_host(mmc);
 	disable_irq(owl_host->irq);
+	dma_release_channel(owl_host->dma);
 	mmc_free_host(mmc);
 
 	return 0;
-- 
2.27.0
