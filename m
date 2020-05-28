From: Colin King <colin.king@canonical.com>
Date: Thu, 28 May 2020 22:12:19 +0000
Subject: [PATCH][next] clk: intel: remove redundant initialization of variable rate64
Message-Id: <20200528221219.535804-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rahul Tanwar <rahul.tanwar@linux.intel.com>, linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable rate64 is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/clk/x86/clk-cgu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/x86/clk-cgu.c b/drivers/clk/x86/clk-cgu.c
index 802a7fa88535..56af0e04ec1e 100644
--- a/drivers/clk/x86/clk-cgu.c
+++ b/drivers/clk/x86/clk-cgu.c
@@ -538,7 +538,7 @@ lgm_clk_ddiv_round_rate(struct clk_hw *hw, unsigned long rate,
 	struct lgm_clk_ddiv *ddiv = to_lgm_clk_ddiv(hw);
 	u32 div, ddiv1, ddiv2;
 	unsigned long flags;
-	u64 rate64 = rate;
+	u64 rate64;
 
 	div = DIV_ROUND_CLOSEST_ULL((u64)*prate, rate);
 
-- 
2.25.1
