From: Mark Brown <broonie@kernel.org>
Date: Wed, 17 Apr 2019 16:42:16 +0000
Subject: Applied "regulator: stm32-pwr: Fix return value check in stm32_pwr_regulator_probe()" to the regulat
Message-Id: <20190417164216.39C531128FCB@debutante.sirena.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20190417023059.162828-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Pascal PAILLET-LME <p.paillet@st.com>, Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org

The patch

   regulator: stm32-pwr: Fix return value check in stm32_pwr_regulator_probe()

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.2

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

From dc62f951a6a8490bcccc7b6de36cd85bd57be740 Mon Sep 17 00:00:00 2001
From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 17 Apr 2019 02:30:59 +0000
Subject: [PATCH] regulator: stm32-pwr: Fix return value check in
 stm32_pwr_regulator_probe()

In case of error, the function of_iomap() returns NULL pointer not
ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: 6cdae8173f67 ("regulator: Add support for stm32 power regulators")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/stm32-pwr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/stm32-pwr.c b/drivers/regulator/stm32-pwr.c
index 222d593d76a2..7b39a41530d4 100644
--- a/drivers/regulator/stm32-pwr.c
+++ b/drivers/regulator/stm32-pwr.c
@@ -140,9 +140,9 @@ static int stm32_pwr_regulator_probe(struct platform_device *pdev)
 	int i, ret = 0;
 
 	base = of_iomap(np, 0);
-	if (IS_ERR(base)) {
+	if (!base) {
 		dev_err(&pdev->dev, "Unable to map IO memory\n");
-		return PTR_ERR(base);
+		return -ENOMEM;
 	}
 
 	config.dev = &pdev->dev;
-- 
2.20.1
