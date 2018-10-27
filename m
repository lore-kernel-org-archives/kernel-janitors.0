From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 27 Oct 2018 05:47:39 +0000
Subject: [PATCH 5/8] clk: pxa: constify clk_ops structures
Message-Id: <1540619262-22681-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540619262-22681-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1540619262-22681-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>
Cc: kernel-janitors@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org

These clk_ops structures are only passed to a call to
clk_register_composite where the corresponding parameters
are const, so the clk_ops structure can be const as well.

Identified and transformed using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/clk/pxa/clk-pxa.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/pxa/clk-pxa.c b/drivers/clk/pxa/clk-pxa.c
index b80dc9d5855c..42627bf8a09e 100644
--- a/drivers/clk/pxa/clk-pxa.c
+++ b/drivers/clk/pxa/clk-pxa.c
@@ -70,7 +70,7 @@ static unsigned long cken_recalc_rate(struct clk_hw *hw,
 	return clk_fixed_factor_ops.recalc_rate(&fix->hw, parent_rate);
 }
 
-static struct clk_ops cken_rate_ops = {
+static const struct clk_ops cken_rate_ops = {
 	.recalc_rate = cken_recalc_rate,
 };
 
@@ -83,7 +83,7 @@ static u8 cken_get_parent(struct clk_hw *hw)
 	return pclk->is_in_low_power() ? 0 : 1;
 }
 
-static struct clk_ops cken_mux_ops = {
+static const struct clk_ops cken_mux_ops = {
 	.get_parent = cken_get_parent,
 	.set_parent = dummy_clk_set_parent,
 };
