From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 16 Jun 2014 09:32:33 +0000
Subject: [patch] CLK: TI: APLL: not allocating enough data
Message-Id: <20140616093233.GA9446@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Turquette <mturquette@linaro.org>
Cc: Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>, J Keerthy <j-keerthy@ti.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a cut and paste bug here which will lead to memory corruption
because we don't allocate enough data.

Fixes: 4d008589e271 ('CLK: TI: APLL: add support for omap2 aplls')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/clk/ti/apll.c b/drivers/clk/ti/apll.c
index 5428c9c..18dbaf12 100644
--- a/drivers/clk/ti/apll.c
+++ b/drivers/clk/ti/apll.c
@@ -338,7 +338,7 @@ static void __init of_omap2_apll_setup(struct device_node *node)
 	const char *parent_name;
 	u32 val;
 
-	ad = kzalloc(sizeof(*clk_hw), GFP_KERNEL);
+	ad = kzalloc(sizeof(*ad), GFP_KERNEL);
 	clk_hw = kzalloc(sizeof(*clk_hw), GFP_KERNEL);
 	init = kzalloc(sizeof(*init), GFP_KERNEL);
 
