From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 May 2019 13:16:51 +0000
Subject: [PATCH] soc: ixp4xx: qmgr: Fix an NULL vs IS_ERR() check in probe
Message-Id: <20190503131651.GC1236@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Krzysztof Halasa <khalasa@piap.pl>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The devm_ioremap_resource() function doesn't retunr NULL, it returns
error pointers.

Fixes: ecc133c6da60 ("soc: ixp4xx: qmgr: Pass resources")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/soc/ixp4xx/ixp4xx-qmgr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ixp4xx/ixp4xx-qmgr.c b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
index 13a8a13c9b01..bb90670ec160 100644
--- a/drivers/soc/ixp4xx/ixp4xx-qmgr.c
+++ b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
@@ -385,8 +385,8 @@ static int ixp4xx_qmgr_probe(struct platform_device *pdev)
 	if (!res)
 		return -ENODEV;
 	qmgr_regs = devm_ioremap_resource(dev, res);
-	if (!qmgr_regs)
-		return -ENOMEM;
+	if (IS_ERR(qmgr_regs))
+		return PTR_ERR(qmgr_regs);
 
 	irq1 = platform_get_irq(pdev, 0);
 	if (irq1 <= 0)
-- 
2.18.0
