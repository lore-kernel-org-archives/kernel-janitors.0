From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 07 Dec 2018 06:34:47 +0000
Subject: [PATCH -next] mmc: remove set but not used variables 'len, clock_out'
Message-Id: <1544164487-52246-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/mmc/host/alcor.c: In function 'alcor_data_set_dma':
drivers/mmc/host/alcor.c:124:12: warning:
 variable 'len' set but not used [-Wunused-but-set-variable]

drivers/mmc/host/alcor.c:648:15: warning:
 variable 'clock_out' set but not used [-Wunused-but-set-variable]

It never used since introduction in commit 2a9a4742e825 ("mmc: add new Alcor
Micro Cardreader SD/MMC driver")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/mmc/host/alcor.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mmc/host/alcor.c b/drivers/mmc/host/alcor.c
index f729a64..c712b7d 100644
--- a/drivers/mmc/host/alcor.c
+++ b/drivers/mmc/host/alcor.c
@@ -121,7 +121,7 @@ static void alcor_reset(struct alcor_sdmmc_host *host, u8 val)
 static void alcor_data_set_dma(struct alcor_sdmmc_host *host)
 {
 	struct alcor_pci_priv *priv = host->alcor_pci;
-	u32 addr, len;
+	u32 addr;
 
 	if (!host->sg_count)
 		return;
@@ -138,7 +138,6 @@ static void alcor_data_set_dma(struct alcor_sdmmc_host *host)
 
 
 	addr = (u32)sg_dma_address(host->sg);
-	len = sg_dma_len(host->sg);
 
 	alcor_write32(priv, addr, AU6601_REG_SDMA_ADDR);
 	host->sg = sg_next(host->sg);
@@ -645,7 +644,6 @@ static irqreturn_t alcor_irq(int irq, void *d)
 static void alcor_set_clock(struct alcor_sdmmc_host *host, unsigned int clock)
 {
 	struct alcor_pci_priv *priv = host->alcor_pci;
-	unsigned int clock_out = 0;
 	int i, diff = 0x7fffffff, tmp_clock = 0;
 	u16 clk_src = 0;
 	u8 clk_div = 0;
@@ -670,7 +668,6 @@ static void alcor_set_clock(struct alcor_sdmmc_host *host, unsigned int clock)
 			diff = tmp_diff;
 			clk_src = cfg->clk_src_reg;
 			clk_div = tmp_div;
-			clock_out = tmp_clock;
 		}
 	}
 
