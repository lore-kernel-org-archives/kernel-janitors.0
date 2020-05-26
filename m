From: Colin King <colin.king@canonical.com>
Date: Tue, 26 May 2020 22:41:16 +0000
Subject: [PATCH] clk: versatile: remove redundant assignment to pointer clk
Message-Id: <20200526224116.63549-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer clk is being initialized with a value that is never read
and is being updated with a new value later on. The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/clk/versatile/clk-versatile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/versatile/clk-versatile.c b/drivers/clk/versatile/clk-versatile.c
index fd54d5c0251c..8ed7a179f651 100644
--- a/drivers/clk/versatile/clk-versatile.c
+++ b/drivers/clk/versatile/clk-versatile.c
@@ -56,7 +56,7 @@ static const struct clk_icst_desc versatile_auxosc_desc __initconst = {
 static void __init cm_osc_setup(struct device_node *np,
 				const struct clk_icst_desc *desc)
 {
-	struct clk *clk = ERR_PTR(-EINVAL);
+	struct clk *clk;
 	const char *clk_name = np->name;
 	const char *parent_name;
 
-- 
2.25.1
