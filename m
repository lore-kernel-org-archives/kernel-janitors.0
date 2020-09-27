From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 27 Sep 2020 19:12:19 +0000
Subject: [PATCH 09/18] clk: mvebu: ap80x-cpu: use semicolons rather than commas to separate statements
Message-Id: <1601233948-11629-10-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org

Replace commas with semicolons.  What is done is essentially described by
the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/clk/mvebu/ap-cpu-clk.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mvebu/ap-cpu-clk.c b/drivers/clk/mvebu/ap-cpu-clk.c
index 6b394302c76a..b4259b60dcfd 100644
--- a/drivers/clk/mvebu/ap-cpu-clk.c
+++ b/drivers/clk/mvebu/ap-cpu-clk.c
@@ -197,7 +197,7 @@ static int ap_cpu_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	stable_bit = BIT(clk->pll_regs->ratio_state_offset +
 			 clk->cluster *
-			 clk->pll_regs->ratio_state_cluster_offset),
+			 clk->pll_regs->ratio_state_cluster_offset);
 	ret = regmap_read_poll_timeout(clk->pll_cr_base,
 				       clk->pll_regs->ratio_state_reg, reg,
 				       reg & stable_bit, STATUS_POLL_PERIOD_US,
