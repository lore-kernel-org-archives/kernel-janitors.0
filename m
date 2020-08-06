From: Colin King <colin.king@canonical.com>
Date: Thu, 06 Aug 2020 11:50:59 +0000
Subject: [PATCH] mmc: sdhci-pci-o2micro: fix spelling mistake "unsupport" -> "unsupported"
Message-Id: <20200806115059.59241-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a pr_info message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mmc/host/sdhci-pci-o2micro.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-pci-o2micro.c b/drivers/mmc/host/sdhci-pci-o2micro.c
index fa76748d8929..4eca8d2d0599 100644
--- a/drivers/mmc/host/sdhci-pci-o2micro.c
+++ b/drivers/mmc/host/sdhci-pci-o2micro.c
@@ -469,7 +469,7 @@ static void sdhci_pci_o2_enable_msi(struct sdhci_pci_chip *chip,
 
 	ret = pci_find_capability(chip->pdev, PCI_CAP_ID_MSI);
 	if (!ret) {
-		pr_info("%s: unsupport msi, use INTx irq\n",
+		pr_info("%s: unsupported msi, use INTx irq\n",
 			mmc_hostname(host->mmc));
 		return;
 	}
-- 
2.27.0
