From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 04 Aug 2020 08:24:03 +0000
Subject: [PATCH] memory: jz4780-nemc: Fix return value check in jz4780_nemc_probe()
Message-Id: <20200804082403.76297-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Cercueil <paul@crapouillou.net>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

In case of error, the function devm_ioremap() returns NULL pointer not
ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: f046e4a3f0b9 ("memory: jz4780_nemc: Only request IO memory the driver will use")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/memory/jz4780-nemc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/memory/jz4780-nemc.c b/drivers/memory/jz4780-nemc.c
index 3ec5cb0fce1e..608ae925e641 100644
--- a/drivers/memory/jz4780-nemc.c
+++ b/drivers/memory/jz4780-nemc.c
@@ -304,9 +304,9 @@ static int jz4780_nemc_probe(struct platform_device *pdev)
 	}
 
 	nemc->base = devm_ioremap(dev, res->start, NEMC_REG_LEN);
-	if (IS_ERR(nemc->base)) {
+	if (!nemc->base) {
 		dev_err(dev, "failed to get I/O memory\n");
-		return PTR_ERR(nemc->base);
+		return -ENOMEM;
 	}
 
 	writel(0, nemc->base + NEMC_NFCSR);
