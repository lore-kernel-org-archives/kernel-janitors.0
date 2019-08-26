From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 26 Aug 2019 02:49:15 +0000
Subject: [PATCH v2 net-next] cirrus: cs89x0: remove set but not used variable 'lp'
Message-Id: <20190826024915.67642-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190822063517.71231-1-yuehaibing@huawei.com>
In-Reply-To: <20190822063517.71231-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, YueHaibing <yuehaibing@huawei.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/cirrus/cs89x0.c: In function 'cs89x0_platform_probe':
drivers/net/ethernet/cirrus/cs89x0.c:1847:20: warning:
 variable 'lp' set but not used [-Wunused-but-set-variable]

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 6751edeb8700 ("cirrus: cs89x0: Use managed interfaces")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v2: add Fixes tag
---
 drivers/net/ethernet/cirrus/cs89x0.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/cirrus/cs89x0.c b/drivers/net/ethernet/cirrus/cs89x0.c
index 2d30972df06b..c9aebcde403a 100644
--- a/drivers/net/ethernet/cirrus/cs89x0.c
+++ b/drivers/net/ethernet/cirrus/cs89x0.c
@@ -1844,15 +1844,12 @@ cleanup_module(void)
 static int __init cs89x0_platform_probe(struct platform_device *pdev)
 {
 	struct net_device *dev = alloc_etherdev(sizeof(struct net_local));
-	struct net_local *lp;
 	void __iomem *virt_addr;
 	int err;
 
 	if (!dev)
 		return -ENOMEM;
 
-	lp = netdev_priv(dev);
-
 	dev->irq = platform_get_irq(pdev, 0);
 	if (dev->irq <= 0) {
 		dev_warn(&dev->dev, "interrupt resource missing\n");
