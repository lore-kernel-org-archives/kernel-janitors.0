From: Colin King <colin.king@canonical.com>
Date: Sun, 09 Dec 2018 15:08:32 +0000
Subject: [PATCH][clk-next] clk: imx: remove redundant initialization of ret to zero
Message-Id: <20181209150832.9366-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The initialization of ret is redundant as it is being re-assigned to
the return value from the call to imx8m_clk_composite_compute_dividers.
Clean this up by removing the initialization.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/clk/imx/clk-composite-8m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-composite-8m.c b/drivers/clk/imx/clk-composite-8m.c
index 6d9d3714b4df..527ade1d6933 100644
--- a/drivers/clk/imx/clk-composite-8m.c
+++ b/drivers/clk/imx/clk-composite-8m.c
@@ -93,7 +93,7 @@ static int imx8m_clk_composite_divider_set_rate(struct clk_hw *hw,
 	unsigned long flags = 0;
 	int prediv_value;
 	int div_value;
-	int ret = 0;
+	int ret;
 	u32 val;
 
 	ret = imx8m_clk_composite_compute_dividers(rate, parent_rate,
-- 
2.19.1
