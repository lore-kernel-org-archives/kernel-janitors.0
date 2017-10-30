From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 30 Oct 2017 15:46:39 +0000
Subject: [PATCH 1/3] pinctrl: mcp23s08: Improve unlocking of a mutex in mcp23s08_irq()
Message-Id: <01bfaa76-f947-f148-077b-35949bf8e229@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ca1c3c19-7e8c-90f0-493c-b6fae04e6a03@users.sourceforge.net>
In-Reply-To: <ca1c3c19-7e8c-90f0-493c-b6fae04e6a03@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 30 Oct 2017 16:03:12 +0100

* Add a jump target so that a call of the function "mutex_unlock" is stored
  only twice in this function implementation.

* Replace five calls by goto statements.

* Adjust five condition checks.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 3e40d4245512..919eb7268331 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -457,31 +457,22 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 		defval_changed, gpio_set;
 
 	mutex_lock(&mcp->lock);
-	if (mcp_read(mcp, MCP_INTF, &intf) < 0) {
-		mutex_unlock(&mcp->lock);
-		return IRQ_HANDLED;
-	}
+	if (mcp_read(mcp, MCP_INTF, &intf))
+		goto unlock;
 
-	if (mcp_read(mcp, MCP_INTCAP, &intcap) < 0) {
-		mutex_unlock(&mcp->lock);
-		return IRQ_HANDLED;
-	}
+	if (mcp_read(mcp, MCP_INTCAP, &intcap))
+		goto unlock;
 
-	if (mcp_read(mcp, MCP_INTCON, &intcon) < 0) {
-		mutex_unlock(&mcp->lock);
-		return IRQ_HANDLED;
-	}
+	if (mcp_read(mcp, MCP_INTCON, &intcon))
+		goto unlock;
 
-	if (mcp_read(mcp, MCP_DEFVAL, &defval) < 0) {
-		mutex_unlock(&mcp->lock);
-		return IRQ_HANDLED;
-	}
+	if (mcp_read(mcp, MCP_DEFVAL, &defval))
+		goto unlock;
 
 	/* This clears the interrupt(configurable on S18) */
-	if (mcp_read(mcp, MCP_GPIO, &gpio) < 0) {
-		mutex_unlock(&mcp->lock);
-		return IRQ_HANDLED;
-	}
+	if (mcp_read(mcp, MCP_GPIO, &gpio))
+		goto unlock;
+
 	gpio_orig = mcp->cached_gpio;
 	mcp->cached_gpio = gpio;
 	mutex_unlock(&mcp->lock);
@@ -543,6 +534,10 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 	}
 
 	return IRQ_HANDLED;
+
+unlock:
+	mutex_unlock(&mcp->lock);
+	return IRQ_HANDLED;
 }
 
 static void mcp23s08_irq_mask(struct irq_data *data)
-- 
2.14.3

