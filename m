From: Colin King <colin.king@canonical.com>
Date: Tue, 03 Oct 2017 10:06:36 +0000
Subject: [PATCH] mmc: sdhci-of-at91: make function sdhci_at91_set_uhs_signaling static
Message-Id: <20171003100636.26124-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ludovic Desroches <ludovic.desroches@microchip.com>, Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function sdhci_at91_set_uhs_signaling  is local to the source and does
not need to be in global scope, so make it static.

Cleans up sparse warning:
symbol 'sdhci_at91_set_uhs_signaling' was not declared. Should it be
static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mmc/host/sdhci-of-at91.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-of-at91.c
index 4e47ed6bc716..682c573e20a7 100644
--- a/drivers/mmc/host/sdhci-of-at91.c
+++ b/drivers/mmc/host/sdhci-of-at91.c
@@ -114,7 +114,8 @@ static void sdhci_at91_set_power(struct sdhci_host *host, unsigned char mode,
 	sdhci_set_power_noreg(host, mode, vdd);
 }
 
-void sdhci_at91_set_uhs_signaling(struct sdhci_host *host, unsigned int timing)
+static void sdhci_at91_set_uhs_signaling(struct sdhci_host *host,
+					 unsigned int timing)
 {
 	if (timing = MMC_TIMING_MMC_DDR52)
 		sdhci_writeb(host, SDMMC_MC1R_DDR, SDMMC_MC1R);
-- 
2.14.1

