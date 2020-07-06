From: Colin King <colin.king@canonical.com>
Date: Mon, 06 Jul 2020 16:30:31 +0000
Subject: [PATCH] mmc: dw_mmc-exynos: remove redundant initialization of variable 'found'
Message-Id: <20200706163031.503431-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable 'found' is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mmc/host/dw_mmc-exynos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/dw_mmc-exynos.c b/drivers/mmc/host/dw_mmc-exynos.c
index 5e3d95b63676..99b900008a03 100644
--- a/drivers/mmc/host/dw_mmc-exynos.c
+++ b/drivers/mmc/host/dw_mmc-exynos.c
@@ -472,7 +472,7 @@ static int dw_mci_exynos_execute_tuning(struct dw_mci_slot *slot, u32 opcode)
 	struct dw_mci_exynos_priv_data *priv = host->priv;
 	struct mmc_host *mmc = slot->mmc;
 	u8 start_smpl, smpl, candiates = 0;
-	s8 found = -1;
+	s8 found;
 	int ret = 0;
 
 	start_smpl = dw_mci_exynos_get_clksmpl(host);
-- 
2.27.0
