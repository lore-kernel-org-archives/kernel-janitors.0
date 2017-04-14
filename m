From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 14 Apr 2017 09:22:24 +0000
Subject: [PATCH 09/10] pinctrl: mxs: Use devm_kcalloc() in two functions
Message-Id: <6b3abc7c-7fae-ce75-585c-8944153a9627@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <59fae4ac-9e07-232a-4843-92dd9e0cf2ef@users.sourceforge.net>
In-Reply-To: <59fae4ac-9e07-232a-4843-92dd9e0cf2ef@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Gary Bisson <gary.bisson@boundarydevices.com>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, Peng Fan <van.freenix@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 13 Apr 2017 16:28:48 +0200

Multiplications for the size determination of memory allocations
indicated that array data structures should be processed.
Thus use the corresponding function "devm_kcalloc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/freescale/pinctrl-mxs.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-mxs.c b/drivers/pinctrl/freescale/pinctrl-mxs.c
index 41b5b07d5a2b..9e6dc0038c35 100644
--- a/drivers/pinctrl/freescale/pinctrl-mxs.c
+++ b/drivers/pinctrl/freescale/pinctrl-mxs.c
@@ -369,12 +369,12 @@ static int mxs_pinctrl_parse_group(struct platform_device *pdev,
 		return -EINVAL;
 	g->npins = length / sizeof(u32);
 
-	g->pins = devm_kzalloc(&pdev->dev, g->npins * sizeof(*g->pins),
+	g->pins = devm_kcalloc(&pdev->dev, g->npins, sizeof(*g->pins),
 			       GFP_KERNEL);
 	if (!g->pins)
 		return -ENOMEM;
 
-	g->muxsel = devm_kzalloc(&pdev->dev, g->npins * sizeof(*g->muxsel),
+	g->muxsel = devm_kcalloc(&pdev->dev, g->npins, sizeof(*g->muxsel),
 				 GFP_KERNEL);
 	if (!g->muxsel)
 		return -ENOMEM;
@@ -425,12 +425,12 @@ static int mxs_pinctrl_probe_dt(struct platform_device *pdev,
 		}
 	}
 
-	soc->functions = devm_kzalloc(&pdev->dev, soc->nfunctions *
+	soc->functions = devm_kcalloc(&pdev->dev, soc->nfunctions,
 				      sizeof(*soc->functions), GFP_KERNEL);
 	if (!soc->functions)
 		return -ENOMEM;
 
-	soc->groups = devm_kzalloc(&pdev->dev, soc->ngroups *
+	soc->groups = devm_kcalloc(&pdev->dev, soc->ngroups,
 				   sizeof(*soc->groups), GFP_KERNEL);
 	if (!soc->groups)
 		return -ENOMEM;
@@ -491,7 +491,8 @@ static int mxs_pinctrl_probe_dt(struct platform_device *pdev,
 
 		if (strcmp(fn, child->name)) {
 			f = &soc->functions[idxf++];
-			f->groups = devm_kzalloc(&pdev->dev, f->ngroups *
+			f->groups = devm_kcalloc(&pdev->dev,
+						 f->ngroups,
 						 sizeof(*f->groups),
 						 GFP_KERNEL);
 			if (!f->groups)
-- 
2.12.2

