From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 11 Jul 2018 13:18:59 +0000
Subject: [PATCH -next] spi: cadence: Fix missing clk_disable_unprepare() on error in cnds_runtime_resume()
Message-Id: <1531315139-184922-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fix the missing clk_disable_unprepare() before return
from cnds_runtime_resume() in the error handling case.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/spi/spi-cadence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-cadence.c b/drivers/spi/spi-cadence.c
index a568f35..7c88f74 100644
--- a/drivers/spi/spi-cadence.c
+++ b/drivers/spi/spi-cadence.c
@@ -739,7 +739,7 @@ static int __maybe_unused cnds_runtime_resume(struct device *dev)
 	ret = clk_prepare_enable(xspi->ref_clk);
 	if (ret) {
 		dev_err(dev, "Cannot enable device clock.\n");
-		clk_disable(xspi->pclk);
+		clk_disable_unprepare(xspi->pclk);
 		return ret;
 	}
 	return 0;



