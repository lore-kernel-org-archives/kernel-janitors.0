From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 26 Feb 2019 01:57:32 +0000
Subject: [PATCH -next] clk: ingenic: Remove set but not used variable 'enable'
Message-Id: <20190226015732.183552-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Paul Cercueil <paul@crapouillou.net>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/clk/ingenic/cgu.c: In function 'ingenic_pll_recalc_rate':
drivers/clk/ingenic/cgu.c:86:15: warning:
 variable 'enable' set but not used [-Wunused-but-set-variable]

It's not used after commit ab27eb4bc365 ("clk: ingenic: Add code to
enable/disable PLLs")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/clk/ingenic/cgu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index b40160eb3372..510b685212d3 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -83,7 +83,7 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	const struct ingenic_cgu_clk_info *clk_info;
 	const struct ingenic_cgu_pll_info *pll_info;
 	unsigned m, n, od_enc, od;
-	bool bypass, enable;
+	bool bypass;
 	unsigned long flags;
 	u32 ctl;
 
@@ -103,7 +103,6 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	od_enc &= GENMASK(pll_info->od_bits - 1, 0);
 	bypass = !pll_info->no_bypass_bit &&
 		 !!(ctl & BIT(pll_info->bypass_bit));
-	enable = !!(ctl & BIT(pll_info->enable_bit));
 
 	if (bypass)
 		return parent_rate;
