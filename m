From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Dec 2018 14:52:01 +0000
Subject: [PATCH] clk: zynqmp: Off by one in zynqmp_is_valid_clock()
Message-Id: <20181203145200.o6gnv5fhuubfgg4u@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>, Jolly Shah <jolly.shah@xilinx.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Michal Simek <michal.simek@xilinx.com>, Rajan Vaja <rajan.vaja@xilinx.com>, Tejas Patel <tejasp@xilinx.com>, linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org

The > comparison should be >= to prevent reading beyond the end of the
clock[] array.

(The clock[] array is allocated in zynqmp_clk_setup() and has
clock_max_idx elements.)

Fixes: 3fde0e16d016 ("drivers: clk: Add ZynqMP clock driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/clk/zynqmp/clkc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/zynqmp/clkc.c b/drivers/clk/zynqmp/clkc.c
index 297f16a20bfc..f65cc0ff76ab 100644
--- a/drivers/clk/zynqmp/clkc.c
+++ b/drivers/clk/zynqmp/clkc.c
@@ -128,7 +128,7 @@ static const struct zynqmp_eemi_ops *eemi_ops;
  */
 static inline int zynqmp_is_valid_clock(u32 clk_id)
 {
-	if (clk_id > clock_max_idx)
+	if (clk_id >= clock_max_idx)
 		return -ENODEV;
 
 	return clock[clk_id].valid;
-- 
2.11.0
