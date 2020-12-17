From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 17 Dec 2020 20:42:36 +0000
Subject: [PATCH] mmc: sdhci-sprd: Fix some resource leaks in the remove function
Message-Id: <20201217204236.163446-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: adrian.hunter@intel.com, ulf.hansson@linaro.org, orsonzhai@gmail.com, baolin.wang7@gmail.com, zhang.lyra@gmail.com
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'sdhci_remove_host()' and 'sdhci_pltfm_free()' should be used in place of
'mmc_remove_host()' and 'mmc_free_host()'.

This avoids some resource leaks, is more in line with the error handling
path of the probe function, and is more consistent with other drivers.

Fixes: fb8bd90f83c4 ("mmc: sdhci-sprd: Add Spreadtrum's initial host controller")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Other adjustment may be needed.
I'm not sure at all of the 0 passed to 'sdhci_remove_host()'. Some drivers
pass 0, some have some more complicated computation.
---
 drivers/mmc/host/sdhci-sprd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci-sprd.c b/drivers/mmc/host/sdhci-sprd.c
index f85171edabeb..5dc36efff47f 100644
--- a/drivers/mmc/host/sdhci-sprd.c
+++ b/drivers/mmc/host/sdhci-sprd.c
@@ -708,14 +708,14 @@ static int sdhci_sprd_remove(struct platform_device *pdev)
 {
 	struct sdhci_host *host = platform_get_drvdata(pdev);
 	struct sdhci_sprd_host *sprd_host = TO_SPRD_HOST(host);
-	struct mmc_host *mmc = host->mmc;
 
-	mmc_remove_host(mmc);
+	sdhci_remove_host(host, 0);
+
 	clk_disable_unprepare(sprd_host->clk_sdio);
 	clk_disable_unprepare(sprd_host->clk_enable);
 	clk_disable_unprepare(sprd_host->clk_2x_enable);
 
-	mmc_free_host(mmc);
+	sdhci_pltfm_free(pdev);
 
 	return 0;
 }
-- 
2.27.0
