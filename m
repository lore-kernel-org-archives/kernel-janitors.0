From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 29 Nov 2019 03:35:34 +0000
Subject: [PATCH -next] clk: bm1800: Remove set but not used variable 'fref'
Message-Id: <20191129033534.188257-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: YueHaibing <yuehaibing@huawei.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/clk/clk-bm1880.c: In function 'bm1880_pll_rate_calc':
drivers/clk/clk-bm1880.c:477:13: warning:
 variable 'fref' set but not used [-Wunused-but-set-variable]

It is never used, so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/clk/clk-bm1880.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/clk-bm1880.c b/drivers/clk/clk-bm1880.c
index 4cd175afce9b..e6d6599d310a 100644
--- a/drivers/clk/clk-bm1880.c
+++ b/drivers/clk/clk-bm1880.c
@@ -474,11 +474,10 @@ static struct bm1880_composite_clock bm1880_composite_clks[] = {
 static unsigned long bm1880_pll_rate_calc(u32 regval, unsigned long parent_rate)
 {
 	u64 numerator;
-	u32 fbdiv, fref, refdiv;
+	u32 fbdiv, refdiv;
 	u32 postdiv1, postdiv2, denominator;
 
 	fbdiv = (regval >> 16) & 0xfff;
-	fref = parent_rate;
 	refdiv = regval & 0x1f;
 	postdiv1 = (regval >> 8) & 0x7;
 	postdiv2 = (regval >> 12) & 0x7;
