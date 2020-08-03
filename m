From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Aug 2020 14:36:07 +0000
Subject: [PATCH] memory: jz4780_nemc: Fix an error pointer vs NULL check in probe()
Message-Id: <20200803143607.GC346925@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Cercueil <paul@crapouillou.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The devm_ioremap() function returns NULL on error, it doesn't return
error pointers.  This bug could lead to an Oops during probe.

Fixes: f046e4a3f0b9 ("memory: jz4780_nemc: Only request IO memory the driver will use")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
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
-- 
2.27.0
