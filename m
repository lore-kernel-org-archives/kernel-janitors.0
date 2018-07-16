From: Mark Brown <broonie@kernel.org>
Date: Mon, 16 Jul 2018 14:30:59 +0000
Subject: Applied "spi: cadence: Fix missing clk_disable_unprepare() on error in cnds_runtime_resume()" to the
Message-Id: <E1ff4Wh-0005Z6-CC@debutante>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The patch

   spi: cadence: Fix missing clk_disable_unprepare() on error in cnds_runtime_resume()

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 2ba87a9bcc7a10aa28af9fbf5b4354b3168366e2 Mon Sep 17 00:00:00 2001
From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 11 Jul 2018 13:18:59 +0000
Subject: [PATCH] spi: cadence: Fix missing clk_disable_unprepare() on error in
 cnds_runtime_resume()

Fix the missing clk_disable_unprepare() before return
from cnds_runtime_resume() in the error handling case.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-cadence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-cadence.c b/drivers/spi/spi-cadence.c
index a568f35522f9..7c88f74f7f47 100644
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
-- 
2.18.0.rc2

