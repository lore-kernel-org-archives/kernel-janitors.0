From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 18 Feb 2019 09:19:06 +0000
Subject: [PATCH] clk: qoriq: Improve an error message
Message-Id: <20190218091906.GA7712@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>, Yuantian Tang <andy.tang@nxp.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org

We intended to print "ret" but there is a copy and paste bug from the
previous error message.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/clk/clk-qoriq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index 0e84f6dfa54e..1212a9be7e80 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -1148,8 +1148,8 @@ static void __init create_one_pll(struct clockgen *cg, int idx)
 		pll->div[i].clk = clk;
 		ret = clk_register_clkdev(clk, pll->div[i].name, NULL);
 		if (ret != 0)
-			pr_err("%s: %s: register to lookup table failed %ld\n",
-			       __func__, pll->div[i].name, PTR_ERR(clk));
+			pr_err("%s: %s: register to lookup table failed %d\n",
+			       __func__, pll->div[i].name, ret);
 
 	}
 }
-- 
2.17.1
