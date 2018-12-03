From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Dec 2018 14:51:43 +0000
Subject: [PATCH] clk: mmp: Off by one in mmp_clk_add()
Message-Id: <20181203145143.qogc62x7ftx4zv4l@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>, Chao Xie <chao.xie@marvell.com>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org

The > comparison should be >= or we write one element beyond the end of
the unit->clk_table[] array.

(The unit->clk_table[] array is allocated in the mmp_clk_init() function
and it has unit->nr_clks elements).

Fixes: 4661fda10f8b ("clk: mmp: add basic support functions for DT support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/clk/mmp/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mmp/clk.c b/drivers/clk/mmp/clk.c
index ad8d483a35cd..ca7d37e2c7be 100644
--- a/drivers/clk/mmp/clk.c
+++ b/drivers/clk/mmp/clk.c
@@ -183,7 +183,7 @@ void mmp_clk_add(struct mmp_clk_unit *unit, unsigned int id,
 		pr_err("CLK %d has invalid pointer %p\n", id, clk);
 		return;
 	}
-	if (id > unit->nr_clks) {
+	if (id >= unit->nr_clks) {
 		pr_err("CLK %d is invalid\n", id);
 		return;
 	}
-- 
2.11.0
