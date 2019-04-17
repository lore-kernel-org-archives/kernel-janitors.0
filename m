From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 17 Apr 2019 02:30:59 +0000
Subject: [PATCH -next] regulator: stm32-pwr: Fix return value check in stm32_pwr_regulator_probe()
Message-Id: <20190417023059.162828-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Pascal PAILLET-LME <p.paillet@st.com>
Cc: kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com

In case of error, the function of_iomap() returns NULL pointer not
ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: 6cdae8173f67 ("regulator: Add support for stm32 power regulators")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/regulator/stm32-pwr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/stm32-pwr.c b/drivers/regulator/stm32-pwr.c
index e434b26d4c8b..d4b9d6accfad 100644
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
