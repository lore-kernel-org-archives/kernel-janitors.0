From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 27 Sep 2020 19:12:11 +0000
Subject: [PATCH 01/18] clk: uniphier: use semicolons rather than commas to separate statements
Message-Id: <1601233948-11629-2-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Stephen Boyd <sboyd@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Replace commas with semicolons.  What is done is essentially described by
the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/clk/uniphier/clk-uniphier-cpugear.c |    2 +-
 drivers/clk/uniphier/clk-uniphier-mux.c     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/uniphier/clk-uniphier-cpugear.c b/drivers/clk/uniphier/clk-uniphier-cpugear.c
index 1a33a08abf2f..a2f01a4da127 100644
--- a/drivers/clk/uniphier/clk-uniphier-cpugear.c
+++ b/drivers/clk/uniphier/clk-uniphier-cpugear.c
@@ -90,7 +90,7 @@ struct clk_hw *uniphier_clk_register_cpugear(struct device *dev,
 	init.ops = &uniphier_clk_cpugear_ops;
 	init.flags = CLK_SET_RATE_PARENT;
 	init.parent_names = data->parent_names;
-	init.num_parents = data->num_parents,
+	init.num_parents = data->num_parents;
 
 	gear->regmap = regmap;
 	gear->regbase = data->regbase;
diff --git a/drivers/clk/uniphier/clk-uniphier-mux.c b/drivers/clk/uniphier/clk-uniphier-mux.c
index c0f4631601e2..462c84321b2d 100644
--- a/drivers/clk/uniphier/clk-uniphier-mux.c
+++ b/drivers/clk/uniphier/clk-uniphier-mux.c
@@ -70,7 +70,7 @@ struct clk_hw *uniphier_clk_register_mux(struct device *dev,
 	init.ops = &uniphier_clk_mux_ops;
 	init.flags = CLK_SET_RATE_PARENT;
 	init.parent_names = data->parent_names;
-	init.num_parents = data->num_parents,
+	init.num_parents = data->num_parents;
 
 	mux->regmap = regmap;
 	mux->reg = data->reg;
