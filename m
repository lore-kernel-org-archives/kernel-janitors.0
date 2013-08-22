From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 22 Aug 2013 12:56:13 +0000
Subject: [patch] mmc: omap_hsmmc: precedence bug in omap_hsmmc_context_restore()
Message-Id: <20130822125613.GB2543@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Balaji T K <balajitk@ti.com>
Cc: Chris Ball <cjb@laptop.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org

'!' has higher precedence than '&' so this doesn't work as intended
although since RESETDONE is 1 it would work if none of the other bits
are set.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Untested.

diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
index 1865321..7346b15 100644
--- a/drivers/mmc/host/omap_hsmmc.c
+++ b/drivers/mmc/host/omap_hsmmc.c
@@ -612,7 +612,7 @@ static int omap_hsmmc_context_restore(struct omap_hsmmc_host *host)
 	if (host->context_loss = context_loss)
 		return 1;
 
-	if (!OMAP_HSMMC_READ(host->base, SYSSTATUS) & RESETDONE)
+	if (!(OMAP_HSMMC_READ(host->base, SYSSTATUS) & RESETDONE))
 		return 1;
 
 	if (host->pdata->controller_flags & OMAP_HSMMC_SUPPORTS_DUAL_VOLT) {
