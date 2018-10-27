From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 27 Oct 2018 05:47:35 +0000
Subject: [PATCH 1/8] clk: max77686: constify clk_ops structure
Message-Id: <1540619262-22681-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1540619262-22681-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1540619262-22681-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: kernel-janitors@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org

The clk_ops structure is only stored in the ops field of a
clk_init_data structure.  This field is const, so the clk_ops
structure can be const as well.

Identified and transformed using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/clk/clk-max77686.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-max77686.c b/drivers/clk/clk-max77686.c
index 02551fe4b87c..22c937644c93 100644
--- a/drivers/clk/clk-max77686.c
+++ b/drivers/clk/clk-max77686.c
@@ -137,7 +137,7 @@ static unsigned long max77686_recalc_rate(struct clk_hw *hw,
 	return 32768;
 }
 
-static struct clk_ops max77686_clk_ops = {
+static const struct clk_ops max77686_clk_ops = {
 	.prepare	= max77686_clk_prepare,
 	.unprepare	= max77686_clk_unprepare,
 	.is_prepared	= max77686_clk_is_prepared,
