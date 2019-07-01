From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 01 Jul 2019 20:24:37 +0000
Subject: [PATCH] clk: Use seq_puts() in possible_parent_show()
Message-Id: <5961554a-6416-48ea-44e2-d8e3c7576af0@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 1 Jul 2019 22:20:40 +0200

A string which did not contain a data format specification should be put
into a sequence. Thus use the corresponding function “seq_puts”.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/clk/clk.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index efa593ecbfa9..140afebeb238 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3013,15 +3013,15 @@ static void possible_parent_show(struct seq_file *s, struct clk_core *core,
 	 */
 	parent = clk_core_get_parent_by_index(core, i);
 	if (parent)
-		seq_printf(s, "%s", parent->name);
+		seq_puts(s, parent->name);
 	else if (core->parents[i].name)
-		seq_printf(s, "%s", core->parents[i].name);
+		seq_puts(s, core->parents[i].name);
 	else if (core->parents[i].fw_name)
 		seq_printf(s, "<%s>(fw)", core->parents[i].fw_name);
 	else if (core->parents[i].index >= 0)
-		seq_printf(s, "%s",
-			   of_clk_get_parent_name(core->of_node,
-						  core->parents[i].index));
+		seq_puts(s,
+			 of_clk_get_parent_name(core->of_node,
+						core->parents[i].index));
 	else
 		seq_puts(s, "(missing)");

--
2.22.0
