From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 May 2020 12:08:04 +0000
Subject: [PATCH] bus: arm-integrator-lm: Fix an IS_ERR() vs NULL check
Message-Id: <20200520120804.GI172354@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The of_find_matching_node() function returns NULL on error, it never
returns error pointers.  This doesn't really impact runtime very much
because if "syscon" is NULL then syscon_node_to_regmap() will return
-EINVAL.  The only runtime difference is that now it returns -ENODEV.

Fixes: ccea5e8a5918 ("bus: Add driver for Integrator/AP logic modules")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
The first patch which added this file doesn't give a good hint what the
subsystem prefix should be so I just guessed "bus: arm-integrator-lm:".

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
-- 
2.26.2
