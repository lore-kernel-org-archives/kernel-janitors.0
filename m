From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Sep 2017 19:41:18 +0000
Subject: [PATCH 1/2] clk-xgene: Delete an error message for a failed memory allocation in two functions
Message-Id: <2a6fb281-932f-e043-f084-355a3020411a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1440d17a-ae7d-0a9c-49b4-611824df5e87@users.sourceforge.net>
In-Reply-To: <1440d17a-ae7d-0a9c-49b4-611824df5e87@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-clk@vger.kernel.org, Loc Ho <lho@apm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 26 Sep 2017 21:19:19 +0200

Omit extra messages for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/clk-xgene.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-xgene.c b/drivers/clk/clk-xgene.c
index 4c75821a3933..3cc84a65f686 100644
--- a/drivers/clk/clk-xgene.c
+++ b/drivers/clk/clk-xgene.c
@@ -146,10 +146,8 @@ static struct clk *xgene_register_clk_pll(struct device *dev,
 
 	/* allocate the APM clock structure */
 	apmclk = kzalloc(sizeof(*apmclk), GFP_KERNEL);
-	if (!apmclk) {
-		pr_err("%s: could not allocate APM clk\n", __func__);
+	if (!apmclk)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	init.name = name;
 	init.ops = &xgene_clk_pll_ops;
@@ -650,10 +648,8 @@ static struct clk *xgene_register_clk(struct device *dev,
 
 	/* allocate the APM clock structure */
 	apmclk = kzalloc(sizeof(*apmclk), GFP_KERNEL);
-	if (!apmclk) {
-		pr_err("%s: could not allocate APM clk\n", __func__);
+	if (!apmclk)
 		return ERR_PTR(-ENOMEM);
-	}
 
 	init.name = name;
 	init.ops = &xgene_clk_ops;
-- 
2.14.1

