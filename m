From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 27 Sep 2017 19:39:48 +0000
Subject: [PATCH 1/2] clk/versatile: Delete two error messages for a failed memory allocation in icst_clk_setu
Message-Id: <fe677e31-35b3-fc18-e63a-0f3d24c9f926@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <66ff55fd-caae-9c98-197d-f6c3fe7a9c49@users.sourceforge.net>
In-Reply-To: <66ff55fd-caae-9c98-197d-f6c3fe7a9c49@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 27 Sep 2017 21:21:23 +0200

Omit extra messages for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/versatile/clk-icst.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/versatile/clk-icst.c b/drivers/clk/versatile/clk-icst.c
index 09fbe66f1f11..20ab4ceffb28 100644
--- a/drivers/clk/versatile/clk-icst.c
+++ b/drivers/clk/versatile/clk-icst.c
@@ -360,15 +360,12 @@ static struct clk *icst_clk_setup(struct device *dev,
 	struct icst_params *pclone;
 
 	icst = kzalloc(sizeof(struct clk_icst), GFP_KERNEL);
-	if (!icst) {
-		pr_err("could not allocate ICST clock!\n");
+	if (!icst)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	pclone = kmemdup(desc->params, sizeof(*pclone), GFP_KERNEL);
 	if (!pclone) {
 		kfree(icst);
-		pr_err("could not clone ICST params\n");
 		return ERR_PTR(-ENOMEM);
 	}
 
-- 
2.14.2

