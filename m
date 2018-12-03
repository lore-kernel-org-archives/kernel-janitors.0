From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Dec 2018 14:50:55 +0000
Subject: [PATCH] clk: mvebu: Off by one bugs in cp110_of_clk_get()
Message-Id: <20181203145055.4fvrmy3c4zyocgsx@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org

These > comparisons should be >= to prevent reading beyond the end of
of the clk_data->hws[] buffer.

The clk_data->hws[] array is allocated in cp110_syscon_common_probe()
when we do:
	cp110_clk_data = devm_kzalloc(dev, sizeof(*cp110_clk_data) +
				      sizeof(struct clk_hw *) * CP110_CLK_NUM,
				      GFP_KERNEL);
As you can see, it has CP110_CLK_NUM elements which is equivalent to
CP110_MAX_CORE_CLOCKS + CP110_MAX_GATABLE_CLOCKS.

Fixes: d3da3eaef7f4 ("clk: mvebu: new driver for Armada CP110 system controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/clk/mvebu/cp110-system-controller.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mvebu/cp110-system-controller.c b/drivers/clk/mvebu/cp110-system-controller.c
index 9781b1bf5998..9235a331b588 100644
--- a/drivers/clk/mvebu/cp110-system-controller.c
+++ b/drivers/clk/mvebu/cp110-system-controller.c
@@ -200,11 +200,11 @@ static struct clk_hw *cp110_of_clk_get(struct of_phandle_args *clkspec,
 	unsigned int idx = clkspec->args[1];
 
 	if (type = CP110_CLK_TYPE_CORE) {
-		if (idx > CP110_MAX_CORE_CLOCKS)
+		if (idx >= CP110_MAX_CORE_CLOCKS)
 			return ERR_PTR(-EINVAL);
 		return clk_data->hws[idx];
 	} else if (type = CP110_CLK_TYPE_GATABLE) {
-		if (idx > CP110_MAX_GATABLE_CLOCKS)
+		if (idx >= CP110_MAX_GATABLE_CLOCKS)
 			return ERR_PTR(-EINVAL);
 		return clk_data->hws[CP110_MAX_CORE_CLOCKS + idx];
 	}
-- 
2.11.0
