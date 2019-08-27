From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 27 Aug 2019 13:27:30 +0000
Subject: [PATCH] clk: renesas: mstp: Delete an unnecessary kfree() call in cpg_mstp_clocks_init()
Message-Id: <e66b822b-026b-29cc-e461-6334aafd1d30@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 27 Aug 2019 15:22:12 +0200

A null pointer would be passed to a call of the function “kfree”
directly after a call of the function “kzalloc” failed at one place.
Remove this superfluous function call.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/renesas/clk-mstp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index 2db9093546c6..09f8894bb91b 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -189,10 +189,8 @@ static void __init cpg_mstp_clocks_init(struct device_node *np)
 	unsigned int i;

 	group = kzalloc(struct_size(group, clks, MSTP_MAX_CLOCKS), GFP_KERNEL);
-	if (group == NULL) {
-		kfree(group);
+	if (!group)
 		return;
-	}

 	clks = group->clks;
 	spin_lock_init(&group->lock);
--
2.23.0
