From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 26 Apr 2020 20:23:55 +0000
Subject: [PATCH] mmc: alcor: Fix a resource leak in an error handling path in 'alcor_pci_sdmmc_drv_probe()'
Message-Id: <20200426202355.43055-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ulf.hansson@linaro.org, drake@endlessm.com, kamlesh.gurudasani@gmail.com, colin.king@canonical.com, linux@rempel-privat.de
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'devm_request_threaded_irq()' fails, resources allocated by
'mmc_alloc_host()' must be freed.

Fixes: c5413ad815a6 ("mmc: add new Alcor Micro Cardreader SD/MMC driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/mmc/host/alcor.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/alcor.c b/drivers/mmc/host/alcor.c
index 1aee485d56d4..026ca9194ce5 100644
--- a/drivers/mmc/host/alcor.c
+++ b/drivers/mmc/host/alcor.c
@@ -1104,7 +1104,7 @@ static int alcor_pci_sdmmc_drv_probe(struct platform_device *pdev)
 
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to get irq for data line\n");
-		return ret;
+		goto free_host;
 	}
 
 	mutex_init(&host->cmd_mutex);
@@ -1116,6 +1116,10 @@ static int alcor_pci_sdmmc_drv_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, host);
 	mmc_add_host(mmc);
 	return 0;
+
+free_host:
+	mmc_free_host(mmc);
+	return ret;
 }
 
 static int alcor_pci_sdmmc_drv_remove(struct platform_device *pdev)
-- 
2.25.1
