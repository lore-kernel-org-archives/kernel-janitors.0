From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 May 2015 08:26:27 +0000
Subject: [patch] clk: socfpga: remove a stray tab
Message-Id: <20150527082627.GD19423@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dinh Nguyen <dinguyen@opensource.altera.com>
Cc: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org

This line was indented too far.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/clk/socfpga/clk-gate-a10.c b/drivers/clk/socfpga/clk-gate-a10.c
index be3e998..83c6780 100644
--- a/drivers/clk/socfpga/clk-gate-a10.c
+++ b/drivers/clk/socfpga/clk-gate-a10.c
@@ -39,7 +39,7 @@ static unsigned long socfpga_gate_clk_recalc_rate(struct clk_hw *hwclk,
 	else if (socfpgaclk->div_reg) {
 		val = readl(socfpgaclk->div_reg) >> socfpgaclk->shift;
 		val &= div_mask(socfpgaclk->width);
-			div = (1 << val);
+		div = (1 << val);
 	}
 
 	return parent_rate / div;
