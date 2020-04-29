From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 29 Apr 2020 02:52:20 +0000
Subject: [PATCH net-next v2] drivers: net: davinci_mdio: fix potential NULL dereference in davinci_mdio_probe
Message-Id: <20200429025220.166415-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427094032.181184-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427094032.181184-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grygorii Strashko <grygorii.strashko@ti.com>, David Lechner <david@lechnology.com>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: linux-omap@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

platform_get_resource() may fail and return NULL, so we should
better check it's return value to avoid a NULL pointer dereference
since devm_ioremap() does not check input parameters for null.

This is detected by Coccinelle semantic patch.

@@
expression pdev, res, n, t, e, e1, e2;
@@

res = \(platform_get_resource\|platform_get_resource_byname\)(pdev, t, n);
+ if (!res)
+   return -EINVAL;
... when != res = NULL
e = devm_ioremap(e1, res->start, e2);

Fixes: 03f66f067560 ("net: ethernet: ti: davinci_mdio: use devm_ioremap()")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
v1 -> v2: add fixes and reviewed-by
---
 drivers/net/ethernet/ti/davinci_mdio.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/ti/davinci_mdio.c b/drivers/net/ethernet/ti/davinci_mdio.c
index 38b7f6d35759..702fdc393da0 100644
--- a/drivers/net/ethernet/ti/davinci_mdio.c
+++ b/drivers/net/ethernet/ti/davinci_mdio.c
@@ -397,6 +397,8 @@ static int davinci_mdio_probe(struct platform_device *pdev)
 	data->dev = dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
 	data->regs = devm_ioremap(dev, res->start, resource_size(res));
 	if (!data->regs)
 		return -ENOMEM;
