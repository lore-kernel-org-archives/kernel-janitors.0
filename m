From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 27 Oct 2018 05:47:37 +0000
Subject: [PATCH 3/8] clk: palmas: constify clk_ops structure
Message-Id: <1540619262-22681-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540619262-22681-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1540619262-22681-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>
Cc: kernel-janitors@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org

The clk_ops structure is only stored in the ops field of clk_init_data
structures.  This field is const, so the clk_ops structure can be
const as well.

Identified and transformed using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/clk/clk-palmas.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-palmas.c b/drivers/clk/clk-palmas.c
index e9612e7068e9..e41a3a9f7528 100644
--- a/drivers/clk/clk-palmas.c
+++ b/drivers/clk/clk-palmas.c
@@ -115,7 +115,7 @@ static int palmas_clks_is_prepared(struct clk_hw *hw)
 	return !!(val & cinfo->clk_desc->enable_mask);
 }
 
-static struct clk_ops palmas_clks_ops = {
+static const struct clk_ops palmas_clks_ops = {
 	.prepare	= palmas_clks_prepare,
 	.unprepare	= palmas_clks_unprepare,
 	.is_prepared	= palmas_clks_is_prepared,
