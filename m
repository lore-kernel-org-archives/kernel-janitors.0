From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 24 Apr 2018 13:26:06 +0000
Subject: [PATCH] mmc: sdhci-cadence: Fix a loop in sdhci_cdns_set_tune_val()
Message-Id: <20180424132606.GA10167@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We were supposed to go through this loop twice but there is a missing if
statement so it only loops once.

Fixes: 213fae74318b ("mmc: sdhci-cadence: send tune request twice to work around errata")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mmc/host/sdhci-cadence.c b/drivers/mmc/host/sdhci-cadence.c
index bc30d1637246..7a343b87b5e5 100644
--- a/drivers/mmc/host/sdhci-cadence.c
+++ b/drivers/mmc/host/sdhci-cadence.c
@@ -274,8 +274,8 @@ static int sdhci_cdns_set_tune_val(struct sdhci_host *host, unsigned int val)
 		ret = readl_poll_timeout(reg, tmp,
 					 !(tmp & SDHCI_CDNS_HRS06_TUNE_UP),
 					 0, 1);
-
-		return ret;
+		if (ret)
+			return ret;
 	}
 
 	return 0;
