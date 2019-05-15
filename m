From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 May 2019 13:14:34 +0000
Subject: [PATCH v2] mmc: tegra: Fix a warning message
Message-Id: <20190515131434.GA18205@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The WARN_ON() macro takes a condition, not a warning message.  Really,
this should probably be dev_warn_once().

Fixes: ea8fc5953e8b ("mmc: tegra: update hw tuning process")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Use dev_warn_once()

 drivers/mmc/host/sdhci-tegra.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index f608417ae967..fc07970acaf5 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -865,7 +865,8 @@ static void tegra_sdhci_tap_correction(struct sdhci_host *host, u8 thd_up,
 	}
 
 	if (!first_fail) {
-		WARN_ON("no edge detected, continue with hw tuned delay.\n");
+		dev_warn_once(mmc_dev(host->mmc),
+			      "no edge detected, continue with hw tuned delay.\n");
 	} else if (first_pass) {
 		/* set tap location at fixed tap relative to the first edge */
 		edge1 = first_fail_tap + (first_pass_tap - first_fail_tap) / 2;
-- 
2.20.1
