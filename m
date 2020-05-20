From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 20 May 2020 03:21:50 +0000
Subject: [PATCH -next] bus: arm-integrator-lm: Fix return value check in integrator_ap_lm_probe()
Message-Id: <20200520032150.165388-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Hulk Robot <hulkci@huawei.com>

In case of error, the function of_find_matching_node() returns NULL
pointer not ERR_PTR(). The IS_ERR() test in the return value check
should be replaced with NULL test.

Fixes: ccea5e8a5918 ("bus: Add driver for Integrator/AP logic modules")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/bus/arm-integrator-lm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/arm-integrator-lm.c b/drivers/bus/arm-integrator-lm.c
index 669ea7e1f92e..845b6c43fef8 100644
--- a/drivers/bus/arm-integrator-lm.c
+++ b/drivers/bus/arm-integrator-lm.c
@@ -78,10 +78,10 @@ static int integrator_ap_lm_probe(struct platform_device *pdev)
 
 	/* Look up the system controller */
 	syscon = of_find_matching_node(NULL, integrator_ap_syscon_match);
-	if (IS_ERR(syscon)) {
+	if (!syscon) {
 		dev_err(dev,
 			"could not find Integrator/AP system controller\n");
-		return PTR_ERR(syscon);
+		return -ENODEV;
 	}
 	map = syscon_node_to_regmap(syscon);
 	if (IS_ERR(map)) {
