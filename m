From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 17 Jan 2018 11:26:18 +0000
Subject: [PATCH -next] clk: samsung: exynos-audss: Remove redundant dev_err call in exynos_audss_clk_probe()
Message-Id: <1516188378-144847-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/samsung/clk-exynos-audss.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index 5bfc92e..b4b057c 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -143,10 +143,8 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	reg_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(reg_base)) {
-		dev_err(dev, "failed to map audss registers\n");
+	if (IS_ERR(reg_base))
 		return PTR_ERR(reg_base);
-	}
 
 	epll = ERR_PTR(-ENODEV);
 



