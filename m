From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Jul 2018 12:02:55 +0000
Subject: [PATCH] pinctrl: actions: signedness bug in owl_pinctrl_probe()
Message-Id: <20180703120255.rbkgt5lm53acnv6n@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

pctrl->irq[i] is unsigned so it can't be less than zero.

Fixes: 6c5d0736e9c0 ("pinctrl: actions: Add interrupt support for OWL S900 SoC")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/actions/pinctrl-owl.c
index 4fa9cc377b3b..07f7be13d15b 100644
--- a/drivers/pinctrl/actions/pinctrl-owl.c
+++ b/drivers/pinctrl/actions/pinctrl-owl.c
@@ -1027,7 +1027,7 @@ int owl_pinctrl_probe(struct platform_device *pdev,
 
 	for (i = 0; i < pctrl->num_irq ; i++) {
 		pctrl->irq[i] = platform_get_irq(pdev, i);
-		if (pctrl->irq[i] < 0) {
+		if ((int)pctrl->irq[i] < 0) {
 			ret = pctrl->irq[i];
 			goto err_exit;
 		}
