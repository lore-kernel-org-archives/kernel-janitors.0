From: Colin King <colin.king@canonical.com>
Date: Wed, 10 Feb 2021 18:49:38 +0000
Subject: [PATCH][next] soc: xilinx: vcu: remove deadcode on null divider check
Message-Id: <20210210184938.146124-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Michal Simek <michal.simek@xilinx.com>, Michael Tretter <m.tretter@pengutronix.de>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer 'divider' has previously been null checked followed by
a return, hence the subsequent null check is redundant deadcode
that can be removed.  Clean up the code and remove it.

Fixes: 9c789deea206 ("soc: xilinx: vcu: implement clock provider for output clocks")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/clk/xilinx/xlnx_vcu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
index d66b1315114e..607936d7a413 100644
--- a/drivers/clk/xilinx/xlnx_vcu.c
+++ b/drivers/clk/xilinx/xlnx_vcu.c
@@ -512,9 +512,6 @@ static void xvcu_clk_hw_unregister_leaf(struct clk_hw *hw)
 
 	mux = clk_hw_get_parent(divider);
 	clk_hw_unregister_mux(mux);
-	if (!divider)
-		return;
-
 	clk_hw_unregister_divider(divider);
 }
 
-- 
2.30.0
