From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 19 May 2014 11:25:48 +0000
Subject: [PATCH] CLK: TI: DRA7: return error code in failure case
Message-Id: <alpine.DEB.2.10.1405191924330.2564@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400473875-22228-1-git-send-email-Julia.Lawall@lip6.fr> <1400473875-22228-4-git-send-email-Julia.Lawall@lip6.fr> <20140519074155.GO15585@mwanda> <5379BC0C.3070401@ti.com>
In-Reply-To: <5379BC0C.3070401@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tero Kristo <t-kristo@ti.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Mike Turquette <mturquette@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, J Keerthy <j-keerthy@ti.com>

From: Julia Lawall <Julia.Lawall@lip6.fr>

Add a returned error code in the MAX_APLL_WAIT_TRIES case.  Remove the
updating of the return variable r to 0 if MAX_APLL_WAIT_TRIES is not yet
reached, because r is already 0 at this point.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
diff --git a/drivers/clk/ti/apll.c b/drivers/clk/ti/apll.c
index b986f61..efc71a0 100644
--- a/drivers/clk/ti/apll.c
+++ b/drivers/clk/ti/apll.c
@@ -77,13 +77,11 @@ static int dra7_apll_enable(struct clk_hw *hw)
 	if (i = MAX_APLL_WAIT_TRIES) {
 		pr_warn("clock: %s failed transition to '%s'\n",
 			clk_name, (state) ? "locked" : "bypassed");
-	} else {
+		r = -EBUSY;
+	} else
 		pr_debug("clock: %s transition to '%s' in %d loops\n",
 			 clk_name, (state) ? "locked" : "bypassed", i);

-		r = 0;
-	}
-
 	return r;
 }

