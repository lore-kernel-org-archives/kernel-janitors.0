From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 27 Oct 2018 05:47:38 +0000
Subject: [PATCH 4/8] clk: pistachio: constify clk_ops structures
Message-Id: <1540619262-22681-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540619262-22681-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1540619262-22681-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>
Cc: kernel-janitors@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org

These clk_ops structures are only stored in the ops field of a
clk_init_data structure.  This field is const, so the clk_ops
structures can be const as well.

Identified and transformed using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/clk/pistachio/clk-pll.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/pistachio/clk-pll.c b/drivers/clk/pistachio/clk-pll.c
index 7e8daab9025b..312c3580187f 100644
--- a/drivers/clk/pistachio/clk-pll.c
+++ b/drivers/clk/pistachio/clk-pll.c
@@ -298,7 +298,7 @@ static unsigned long pll_gf40lp_frac_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static struct clk_ops pll_gf40lp_frac_ops = {
+static const struct clk_ops pll_gf40lp_frac_ops = {
 	.enable = pll_gf40lp_frac_enable,
 	.disable = pll_gf40lp_frac_disable,
 	.is_enabled = pll_gf40lp_frac_is_enabled,
@@ -307,7 +307,7 @@ static struct clk_ops pll_gf40lp_frac_ops = {
 	.set_rate = pll_gf40lp_frac_set_rate,
 };
 
-static struct clk_ops pll_gf40lp_frac_fixed_ops = {
+static const struct clk_ops pll_gf40lp_frac_fixed_ops = {
 	.enable = pll_gf40lp_frac_enable,
 	.disable = pll_gf40lp_frac_disable,
 	.is_enabled = pll_gf40lp_frac_is_enabled,
@@ -430,7 +430,7 @@ static unsigned long pll_gf40lp_laint_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static struct clk_ops pll_gf40lp_laint_ops = {
+static const struct clk_ops pll_gf40lp_laint_ops = {
 	.enable = pll_gf40lp_laint_enable,
 	.disable = pll_gf40lp_laint_disable,
 	.is_enabled = pll_gf40lp_laint_is_enabled,
@@ -439,7 +439,7 @@ static struct clk_ops pll_gf40lp_laint_ops = {
 	.set_rate = pll_gf40lp_laint_set_rate,
 };
 
-static struct clk_ops pll_gf40lp_laint_fixed_ops = {
+static const struct clk_ops pll_gf40lp_laint_fixed_ops = {
 	.enable = pll_gf40lp_laint_enable,
 	.disable = pll_gf40lp_laint_disable,
 	.is_enabled = pll_gf40lp_laint_is_enabled,
