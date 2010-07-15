From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu, 15 Jul 2010 18:43:15 +0000
Subject: [PATCH 1/8] arm/mach-tegra: fix unsigned calcs
Message-Id: <1279219395-12088-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

divider_u71 is unsigned, so this check is buggy:
if (divider_u71 - 2 > 255 || divider_u71 - 2 < 0)

If divider_u71 is 0 or 1 both checks are lying.
So, it does not produce a buggy answer, but it is confusing.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 arch/arm/mach-tegra/tegra2_clocks.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
index 4261632..64df5b4 100644
--- a/arch/arm/mach-tegra/tegra2_clocks.c
+++ b/arch/arm/mach-tegra/tegra2_clocks.c
@@ -149,7 +149,7 @@ static int clk_div71_get_divider(struct clk *c, unsigned long rate)
 
 	divider_u71 = DIV_ROUND_UP(c->rate * 2, rate);
 
-	if (divider_u71 - 2 > 255 || divider_u71 - 2 < 0)
+	if (divider_u71 > 2 + 255 || divider_u71 < 2)
 		return -EINVAL;
 
 	return divider_u71 - 2;
-- 
1.7.0.4

