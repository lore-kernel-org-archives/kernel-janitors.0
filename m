From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 27 Oct 2018 05:47:40 +0000
Subject: [PATCH 6/8] clk: s2mps11: constify clk_ops structure
Message-Id: <1540619262-22681-7-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540619262-22681-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1540619262-22681-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: kernel-janitors@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org

The clk_ops structure is only stored in the ops fields of
clk_init_data structures.  This field is const, so the clk_ops
structure can be const as well.

Identified and transformed using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/clk/clk-s2mps11.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index 5b419b82f7ca..2ce370c804aa 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -71,7 +71,7 @@ static unsigned long s2mps11_clk_recalc_rate(struct clk_hw *hw,
 	return 32768;
 }
 
-static struct clk_ops s2mps11_clk_ops = {
+static const struct clk_ops s2mps11_clk_ops = {
 	.prepare	= s2mps11_clk_prepare,
 	.unprepare	= s2mps11_clk_unprepare,
 	.is_prepared	= s2mps11_clk_is_prepared,
