From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Aug 2014 08:14:17 +0000
Subject: [patch] clk: checking wrong variable in __set_clk_parents()
Message-Id: <20140801081417.GA28869@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Turquette <mturquette@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a cut and paste bug so we check "pclk" instead of "clk".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
index 1f73019..4e1bda7 100644
--- a/drivers/clk/clk-conf.c
+++ b/drivers/clk/clk-conf.c
@@ -55,10 +55,10 @@ static int __set_clk_parents(struct device_node *node, bool clk_supplier)
 			goto err;
 		}
 		clk = of_clk_get_by_clkspec(&clkspec);
-		if (IS_ERR(pclk)) {
+		if (IS_ERR(clk)) {
 			pr_warn("clk: couldn't get parent clock %d for %s\n",
 				index, node->full_name);
-			rc = PTR_ERR(pclk);
+			rc = PTR_ERR(clk);
 			goto err;
 		}
 
