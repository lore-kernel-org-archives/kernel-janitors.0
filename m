From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 27 Apr 2020 09:33:43 +0000
Subject: [PATCH net-next] net: ethernet: ti: fix return value check in k3_cppi_desc_pool_create_name()
Message-Id: <20200427093343.157119-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

In case of error, the function gen_pool_create() returns NULL pointer
not ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: 93a76530316a ("net: ethernet: ti: introduce am65x/j721e gigabit eth subsystem driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/ti/k3-cppi-desc-pool.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
index ad7cfc1316ce..38cc12f9f133 100644
--- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
+++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
@@ -64,8 +64,8 @@ k3_cppi_desc_pool_create_name(struct device *dev, size_t size,
 		return ERR_PTR(-ENOMEM);
 
 	pool->gen_pool = gen_pool_create(ilog2(pool->desc_size), -1);
-	if (IS_ERR(pool->gen_pool)) {
-		ret = PTR_ERR(pool->gen_pool);
+	if (!pool->gen_pool) {
+		ret = -ENOMEM;
 		dev_err(pool->dev, "pool create failed %d\n", ret);
 		kfree_const(pool_name);
 		goto gen_pool_create_fail;
