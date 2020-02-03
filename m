From: Colin King <colin.king@canonical.com>
Date: Mon, 03 Feb 2020 22:37:36 +0000
Subject: [PATCH][next] clk: ls1028a: fix a dereference of pointer 'parent' before a null check
Message-Id: <20200203223736.99645-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Wen He <wen.he_1@nxp.com>, Michael Walle <michael@walle.cc>, linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently the pointer 'parent' is being dereferenced before it is
being null checked. Fix this by performing the null check before
it is dereferenced.

Addresses-Coverity: ("Dereference before null check")
Fixes: d37010a3c162 ("clk: ls1028a: Add clock driver for Display output interface")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/clk/clk-plldig.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-plldig.c b/drivers/clk/clk-plldig.c
index a5da08f98d01..f7c349d9c2dc 100644
--- a/drivers/clk/clk-plldig.c
+++ b/drivers/clk/clk-plldig.c
@@ -187,7 +187,7 @@ static int plldig_init(struct clk_hw *hw)
 {
 	struct clk_plldig *data = to_clk_plldig(hw);
 	struct clk_hw *parent = clk_hw_get_parent(hw);
-	unsigned long parent_rate = clk_hw_get_rate(parent);
+	unsigned long parent_rate;
 	unsigned long val;
 	unsigned long long lltmp;
 	unsigned int mfd, fracdiv = 0;
@@ -195,6 +195,8 @@ static int plldig_init(struct clk_hw *hw)
 	if (!parent)
 		return -EINVAL;
 
+	parent_rate = clk_hw_get_rate(parent);
+
 	if (data->vco_freq) {
 		mfd = data->vco_freq / parent_rate;
 		lltmp = data->vco_freq % parent_rate;
-- 
2.24.0
