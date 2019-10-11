From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 11 Oct 2019 05:24:36 +0000
Subject: [PATCH -next] soc: ti: omap-prm: fix return value check in omap_prm_probe()
Message-Id: <20191011052436.76075-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Santosh Shilimkar <ssantosh@kernel.org>, Tero Kristo <t-kristo@ti.com>
Cc: kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

In case of error, the function devm_ioremap_resource() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

Fixes: 3e99cb214f03 ("soc: ti: add initial PRM driver with reset control support")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/soc/ti/omap_prm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ti/omap_prm.c b/drivers/soc/ti/omap_prm.c
index db47a8bceb87..96c6f777519c 100644
--- a/drivers/soc/ti/omap_prm.c
+++ b/drivers/soc/ti/omap_prm.c
@@ -375,8 +375,8 @@ static int omap_prm_probe(struct platform_device *pdev)
 	prm->data = data;
 
 	prm->base = devm_ioremap_resource(&pdev->dev, res);
-	if (!prm->base)
-		return -ENOMEM;
+	if (IS_ERR(prm->base))
+		return PTR_ERR(prm->base);
 
 	return omap_prm_reset_init(pdev, prm);
 }
