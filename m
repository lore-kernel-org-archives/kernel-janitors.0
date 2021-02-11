From: Colin King <colin.king@canonical.com>
Date: Thu, 11 Feb 2021 09:57:00 +0000
Subject: [PATCH][next][V2] soc: xilinx: vcu: fix error check on clk_hw_get_parent call
Message-Id: <20210211095700.158960-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Michal Simek <michal.simek@xilinx.com>, Michael Tretter <m.tretter@pengutronix.de>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the check for failur on the call to clk_hw_get_parent
is checking for a null return in the divider pointer instead of
checking the mux pointer. Fix this.

Thanks to Michael Tretter for suggesting the correct fix.

Addresses-Coverity: ("Logically Dead Code")
Fixes: 9c789deea206 ("soc: xilinx: vcu: implement clock provider for output clocks")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---

V2: Check on mux pointer rather than removing deadcode that wasn't
    actually really dead code.

---
 drivers/clk/xilinx/xlnx_vcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/xilinx/xlnx_vcu.c b/drivers/clk/xilinx/xlnx_vcu.c
index d66b1315114e..256b8c4b9ee4 100644
--- a/drivers/clk/xilinx/xlnx_vcu.c
+++ b/drivers/clk/xilinx/xlnx_vcu.c
@@ -512,7 +512,7 @@ static void xvcu_clk_hw_unregister_leaf(struct clk_hw *hw)
 
 	mux = clk_hw_get_parent(divider);
 	clk_hw_unregister_mux(mux);
-	if (!divider)
+	if (!mux)
 		return;
 
 	clk_hw_unregister_divider(divider);
-- 
2.30.0
