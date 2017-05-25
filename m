From: Colin King <colin.king@canonical.com>
Date: Thu, 25 May 2017 16:51:34 +0000
Subject: [PATCH] spi: omap2-mcspi: remove redundant check for error status
Message-Id: <20170525165134.18103-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Colin Ian King <colin.king@canonical.com>

The check to see if status is less than zero is actually redundant
as all previous places where it is -ve have already branched to the
exit paths, so it is never less than zero at the check.

Detected by CoverityScan, CID#1357119 ("Logically dead code")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/spi/spi-omap2-mcspi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/spi/spi-omap2-mcspi.c b/drivers/spi/spi-omap2-mcspi.c
index 7275223dbcd4..e048268d8ba2 100644
--- a/drivers/spi/spi-omap2-mcspi.c
+++ b/drivers/spi/spi-omap2-mcspi.c
@@ -1412,9 +1412,6 @@ static int omap2_mcspi_probe(struct platform_device *pdev)
 		sprintf(mcspi->dma_channels[i].dma_tx_ch_name, "tx%d", i);
 	}
 
-	if (status < 0)
-		goto free_master;
-
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, SPI_AUTOSUSPEND_TIMEOUT);
 	pm_runtime_enable(&pdev->dev);
-- 
2.11.0

