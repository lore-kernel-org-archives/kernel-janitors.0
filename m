From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 23 Aug 2018 13:59:25 +0000
Subject: [PATCH] PM / clk: signedness bug in of_pm_clk_add_clks()
Message-Id: <20180823135925.6tt64b7tvbmeidiv@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"count" needs to be signed for the error handling to work.  I made "i"
signed as well so they match.

Fixes: 02113ba93ea4 ("PM / clk: Add support for obtaining clocks from device-tree")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_ops.c
index 8e2e4757adcb..5a42ae4078c2 100644
--- a/drivers/base/power/clock_ops.c
+++ b/drivers/base/power/clock_ops.c
@@ -185,7 +185,7 @@ EXPORT_SYMBOL_GPL(of_pm_clk_add_clk);
 int of_pm_clk_add_clks(struct device *dev)
 {
 	struct clk **clks;
-	unsigned int i, count;
+	int i, count;
 	int ret;
 
 	if (!dev || !dev->of_node)
