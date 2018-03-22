From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 22 Mar 2018 02:11:48 +0000
Subject: [PATCH -next] clk: davinci: Remove redundant dev_err calls
Message-Id: <1521684708-79015-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Lechner <david@lechnology.com>, Sekhar Nori <nsekhar@ti.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/davinci/psc.c | 4 +---
 drivers/clk/davinci/pll.c | 4 +---
 2 file changed, 2 insertion(+), 6 deletions(-)

diff --git a/drivers/clk/davinci/psc.c b/drivers/clk/davinci/psc.c
index 3b0e59d..ff6f4a0 100644
--- a/drivers/clk/davinci/psc.c
+++ b/drivers/clk/davinci/psc.c
@@ -521,10 +521,8 @@ static int davinci_psc_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(base)) {
-		dev_err(dev, "ioremap failed\n");
+	if (IS_ERR(base))
 		return PTR_ERR(base);
-	}
 
 	ret = devm_clk_bulk_get(dev, init_data->num_parent_clks,
 				init_data->parent_clks);
diff --git a/drivers/clk/davinci/pll.c b/drivers/clk/davinci/pll.c
index 89d30bf..23a24c9 100644
--- a/drivers/clk/davinci/pll.c
+++ b/drivers/clk/davinci/pll.c
@@ -814,10 +814,8 @@ static int davinci_pll_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(base)) {
-		dev_err(dev, "ioremap failed\n");
+	if (IS_ERR(base))
 		return PTR_ERR(base);
-	}
 
 	return pll_init(dev, base);
 }

