From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 May 2019 09:35:14 +0000
Subject: [PATCH] mmc: tegra: Fix a warning message
Message-Id: <20190515093512.GD3409@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The WARN_ON() macro takes a condition, not a warning message.  I've
changed this to use WARN(1, "msg...

Fixes: ea8fc5953e8b ("mmc: tegra: update hw tuning process")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mmc/host/sdhci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index f608417ae967..10d7aaf68bab 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -865,7 +865,7 @@ static void tegra_sdhci_tap_correction(struct sdhci_host *host, u8 thd_up,
 	}
 
 	if (!first_fail) {
-		WARN_ON("no edge detected, continue with hw tuned delay.\n");
+		WARN(1, "no edge detected, continue with hw tuned delay.\n");
 	} else if (first_pass) {
 		/* set tap location at fixed tap relative to the first edge */
 		edge1 = first_fail_tap + (first_pass_tap - first_fail_tap) / 2;
-- 
2.20.1
