From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 05 Sep 2018 11:12:08 +0000
Subject: [PATCH -next] mmc: tegra: Fix copy-paste error in tegra_sdhci_init_pinctrl_info()
Message-Id: <1536145928-15629-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The error code get against a wrong variable. This patch fix it.

Fixes: 5783a9529891 ("mmc: tegra: Reconfigure pad voltages during voltage switching")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/mmc/host/sdhci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index e80716c..c789158 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -724,7 +724,7 @@ static int tegra_sdhci_init_pinctrl_info(struct device *dev,
 		pinctrl_lookup_state(tegra_host->pinctrl_sdmmc, "sdmmc-1v8");
 	if (IS_ERR(tegra_host->pinctrl_state_1v8)) {
 		dev_warn(dev, "Missing 1.8V pad state, err: %ld\n",
-			 PTR_ERR(tegra_host->pinctrl_state_3v3));
+			 PTR_ERR(tegra_host->pinctrl_state_1v8));
 		return -1;
 	}
