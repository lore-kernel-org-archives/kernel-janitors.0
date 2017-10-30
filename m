From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 30 Oct 2017 15:47:55 +0000
Subject: [PATCH 2/3] pinctrl: mcp23s08: Use common error handling code in mcp23s08_dbg_show()
Message-Id: <3e95d8b5-8306-ae4c-487b-44c6dc1811d6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ca1c3c19-7e8c-90f0-493c-b6fae04e6a03@users.sourceforge.net>
In-Reply-To: <ca1c3c19-7e8c-90f0-493c-b6fae04e6a03@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 30 Oct 2017 16:26:09 +0100

* The script "checkpatch.pl" pointed information out like the following.

  WARNING: Prefer seq_puts to seq_printf

  Thus fix the affected source code places.

* Adjust jump targets so that a bit of exception handling can be better
  reused at the end of this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 919eb7268331..d1a7c627dbb9 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -723,25 +723,20 @@ static void mcp23s08_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	mutex_lock(&mcp->lock);
 
 	t = __check_mcp23s08_reg_cache(mcp);
-	if (t) {
-		seq_printf(s, " I/O Error\n");
-		goto done;
-	}
+	if (t)
+		goto report_failure;
+
 	t = mcp_read(mcp, MCP_IODIR, &iodir);
-	if (t) {
-		seq_printf(s, " I/O Error\n");
-		goto done;
-	}
+	if (t)
+		goto report_failure;
+
 	t = mcp_read(mcp, MCP_GPIO, &gpio);
-	if (t) {
-		seq_printf(s, " I/O Error\n");
-		goto done;
-	}
+	if (t)
+		goto report_failure;
+
 	t = mcp_read(mcp, MCP_GPPU, &gppu);
-	if (t) {
-		seq_printf(s, " I/O Error\n");
-		goto done;
-	}
+	if (t)
+		goto report_failure;
 
 	for (t = 0, mask = BIT(0); t < chip->ngpio; t++, mask <<= 1) {
 		const char *label;
@@ -758,8 +753,13 @@ static void mcp23s08_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 		/* NOTE:  ignoring the irq-related registers */
 		seq_puts(s, "\n");
 	}
-done:
+unlock:
 	mutex_unlock(&mcp->lock);
+	return;
+
+report_failure:
+	seq_puts(s, " I/O Error\n");
+	goto unlock;
 }
 
 #else
-- 
2.14.3

