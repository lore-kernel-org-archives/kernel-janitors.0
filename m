From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 19 May 2014 04:31:05 +0000
Subject: [PATCH 3/13] CLK: TI: DRA7: make return of 0 explicit
Message-Id: <1400473875-22228-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400473875-22228-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1400473875-22228-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Turquette <mturquette@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Delete unnecessary local variable whose value is always 0 and that hides
the fact that the result is always 0.

Additionally dropped some unneeded braces in an affected if.

A simplified version of the semantic patch that fixes this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
local idexpression ret;
expression e;
position p;
@@

-ret = 0;
... when != ret = e
return 
- ret
+ 0
  ;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Alternatively, is an error code wanted in either of the MAX_APLL_WAIT_TRIES
cases?

 drivers/clk/ti/apll.c |   13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/ti/apll.c b/drivers/clk/ti/apll.c
index b986f61..659032a 100644
--- a/drivers/clk/ti/apll.c
+++ b/drivers/clk/ti/apll.c
@@ -37,7 +37,7 @@
 static int dra7_apll_enable(struct clk_hw *hw)
 {
 	struct clk_hw_omap *clk = to_clk_hw_omap(hw);
-	int r = 0, i = 0;
+	int i = 0;
 	struct dpll_data *ad;
 	const char *clk_name;
 	u8 state = 1;
@@ -55,7 +55,7 @@ static int dra7_apll_enable(struct clk_hw *hw)
 	v = ti_clk_ll_ops->clk_readl(ad->idlest_reg);
 
 	if ((v & ad->idlest_mask) = state)
-		return r;
+		return 0;
 
 	v = ti_clk_ll_ops->clk_readl(ad->control_reg);
 	v &= ~ad->enable_mask;
@@ -74,17 +74,14 @@ static int dra7_apll_enable(struct clk_hw *hw)
 		udelay(1);
 	}
 
-	if (i = MAX_APLL_WAIT_TRIES) {
+	if (i = MAX_APLL_WAIT_TRIES)
 		pr_warn("clock: %s failed transition to '%s'\n",
 			clk_name, (state) ? "locked" : "bypassed");
-	} else {
+	else
 		pr_debug("clock: %s transition to '%s' in %d loops\n",
 			 clk_name, (state) ? "locked" : "bypassed", i);
 
-		r = 0;
-	}
-
-	return r;
+	return 0;
 }
 
 static void dra7_apll_disable(struct clk_hw *hw)

