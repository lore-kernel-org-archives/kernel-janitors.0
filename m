From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sat, 01 Aug 2020 08:53:42 +0000
Subject: [PATCH] clk: drop unused function __clk_get_flags
Message-Id: <1596272022-14173-1-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>
Cc: kernel-janitors@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org

The function __clk_get_flags has not been used since the April 2019
commit a348f05361c9 ("ARM: omap2+: hwmod: drop CLK_IS_BASIC
flag usage").  Other uses were removed in June 2015, eg by
commit 98d8a60eccee ("clk: Convert __clk_get_flags() to
clk_hw_get_flags()"), which shows how clk_hw_get_flags can easily
be used instead.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/clk/clk.c            |    6 ------
 include/linux/clk-provider.h |    1 -
 2 files changed, 7 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8aed0c3ff122..0a9261a099bd 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -500,12 +500,6 @@ static unsigned long clk_core_get_accuracy_no_lock(struct clk_core *core)
 	return core->accuracy;
 }
 
-unsigned long __clk_get_flags(struct clk *clk)
-{
-	return !clk ? 0 : clk->core->flags;
-}
-EXPORT_SYMBOL_GPL(__clk_get_flags);
-
 unsigned long clk_hw_get_flags(const struct clk_hw *hw)
 {
 	return hw->core->flags;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 6f815be99b77..03a5de5f99f4 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1096,7 +1096,6 @@ int clk_hw_get_parent_index(struct clk_hw *hw);
 int clk_hw_set_parent(struct clk_hw *hw, struct clk_hw *new_parent);
 unsigned int __clk_get_enable_count(struct clk *clk);
 unsigned long clk_hw_get_rate(const struct clk_hw *hw);
-unsigned long __clk_get_flags(struct clk *clk);
 unsigned long clk_hw_get_flags(const struct clk_hw *hw);
 #define clk_hw_can_set_rate_parent(hw) \
 	(clk_hw_get_flags((hw)) & CLK_SET_RATE_PARENT)
