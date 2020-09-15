From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 15 Sep 2020 07:57:32 +0000
Subject: [PATCH -next] soc: ti: pruss: Fix return value check
Message-Id: <20200915075732.100804-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Santosh Shilimkar <ssantosh@kernel.org>, Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc: kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Hulk Robot <hulkci@huawei.com>

In case of error, the function of_device_get_match_data() returns NULL
pointer not ERR_PTR(). The IS_ERR() test in the return value check
should be replaced with NULL test.

Fixes: ba59c9b43c86 ("soc: ti: pruss: support CORECLK_MUX and IEPCLK_MUX")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/soc/ti/pruss.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ti/pruss.c b/drivers/soc/ti/pruss.c
index cc0b4ad7a3d3..582f48051c30 100644
--- a/drivers/soc/ti/pruss.c
+++ b/drivers/soc/ti/pruss.c
@@ -126,7 +126,7 @@ static int pruss_clk_init(struct pruss *pruss, struct device_node *cfg_node)
 	int ret = 0;
 
 	data = of_device_get_match_data(dev);
-	if (IS_ERR(data))
+	if (!data)
 		return -ENODEV;
 
 	clks_np = of_get_child_by_name(cfg_node, "clocks");
@@ -175,7 +175,7 @@ static int pruss_probe(struct platform_device *pdev)
 	const char *mem_names[PRUSS_MEM_MAX] = { "dram0", "dram1", "shrdram2" };
 
 	data = of_device_get_match_data(&pdev->dev);
-	if (IS_ERR(data)) {
+	if (!data) {
 		dev_err(dev, "missing private data\n");
 		return -ENODEV;
 	}
