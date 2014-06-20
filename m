From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Jun 2014 07:19:01 +0000
Subject: [patch] mmc: sdhci-bcm-kona: | vs & typo in debug code
Message-Id: <20140620071901.GA22779@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Ball <chris@printf.net>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Christian Daudt <csd@broadcom.com>, Russell King <rmk+kernel@arm.linux.org.uk>, Matt Porter <mporter@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, Markus Mayer <markus.mayer@linaro.org>, Tim Kryger <tim.kryger@linaro.org>, Axel Lin <axel.lin@ingics.com>, linux-mmc@vger.kernel.org, kernel-janitors@vger.kernel.org

The debug printk says that 8bit is always true because of a '|' vs '&'
typo.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mmc/host/sdhci-bcm-kona.c b/drivers/mmc/host/sdhci-bcm-kona.c
index dd780c3..2d3f3c0 100644
--- a/drivers/mmc/host/sdhci-bcm-kona.c
+++ b/drivers/mmc/host/sdhci-bcm-kona.c
@@ -290,7 +290,7 @@ static int sdhci_bcm_kona_probe(struct platform_device *pdev)
 		host->quirks |= SDHCI_QUIRK_BROKEN_CARD_DETECTION;
 
 	dev_dbg(dev, "is_8bit=%c\n",
-		(host->mmc->caps | MMC_CAP_8_BIT_DATA) ? 'Y' : 'N');
+		(host->mmc->caps & MMC_CAP_8_BIT_DATA) ? 'Y' : 'N');
 
 	ret = sdhci_bcm_kona_sd_reset(host);
 	if (ret)
