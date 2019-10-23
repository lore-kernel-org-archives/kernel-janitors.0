From: Colin King <colin.king@canonical.com>
Date: Wed, 23 Oct 2019 11:28:09 +0000
Subject: [PATCH] clk: sunxi-ng: a80: fix the zero'ing of bits 16 and 18
Message-Id: <20191023112809.27595-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The zero'ing of bits 16 and 18 is incorrect. Currently the code
is masking with the bitwise-and of BIT(16) & BIT(18) which is
0, so the updated value for val is always zero. Fix this by bitwise
and-ing value with the correct mask that will zero bits 16 and 18.

Addresses-Coverity: (" Suspicious &= or |= constant expression")
Fixes: b8eb71dcdd08 ("clk: sunxi-ng: Add A80 CCU")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/clk/sunxi-ng/ccu-sun9i-a80.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun9i-a80.c b/drivers/clk/sunxi-ng/ccu-sun9i-a80.c
index dcac1391767f..ef29582676f6 100644
--- a/drivers/clk/sunxi-ng/ccu-sun9i-a80.c
+++ b/drivers/clk/sunxi-ng/ccu-sun9i-a80.c
@@ -1224,7 +1224,7 @@ static int sun9i_a80_ccu_probe(struct platform_device *pdev)
 
 	/* Enforce d1 = 0, d2 = 0 for Audio PLL */
 	val = readl(reg + SUN9I_A80_PLL_AUDIO_REG);
-	val &= (BIT(16) & BIT(18));
+	val &= ~(BIT(16) | BIT(18));
 	writel(val, reg + SUN9I_A80_PLL_AUDIO_REG);
 
 	/* Enforce P = 1 for both CPU cluster PLLs */
-- 
2.20.1
