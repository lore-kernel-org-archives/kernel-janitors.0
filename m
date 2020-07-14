From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Jul 2020 14:14:10 +0000
Subject: [PATCH] mmc: sdhci: Fix a potential uninitialized variable
Message-Id: <20200714141410.GB314989@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Veerabhadrarao Badiganti <vbadigan@codeaurora.org>, linux-mmc@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that "ret" can be used without being initialized.

drivers/mmc/host/sdhci.c
  4383          if (!IS_ERR(mmc->supply.vqmmc)) {
  4384                  if (enable_vqmmc) {
                            ^^^^^^^^^^^^
  4385                          ret = regulator_enable(mmc->supply.vqmmc);
                                ^^^^^
  4386                          host->sdhci_core_to_disable_vqmmc = !ret;
  4387                  }

"ret" is only initialized when "enable_vqmmc" is true.

Fixes: b13099a4dea6 ("mmc: sdhci: Fix potential null pointer access while accessing vqmmc")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/mmc/host/sdhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
index 8db06da55602..3ad394b40eb1 100644
--- a/drivers/mmc/host/sdhci.c
+++ b/drivers/mmc/host/sdhci.c
@@ -4104,7 +4104,7 @@ int sdhci_setup_host(struct sdhci_host *host)
 	unsigned int ocr_avail;
 	unsigned int override_timeout_clk;
 	u32 max_clk;
-	int ret;
+	int ret = 0;
 	bool enable_vqmmc = false;
 
 	WARN_ON(host = NULL);
-- 
2.27.0
