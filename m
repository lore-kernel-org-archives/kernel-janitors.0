From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 26 Aug 2012 16:01:02 +0000
Subject: [PATCH 10/13] drivers/watchdog/sp805_wdt.c: use clk_prepare_enable and clk_disable_unprepare
Message-Id: <1345996865-32082-11-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345996865-32082-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345996865-32082-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wim Van Sebroeck <wim@iguana.be>
Cc: kernel-janitors@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Clk_prepare_enable and clk_disable_unprepare combine clk_prepare and
clk_enable, and clk_disable and clk_unprepare.  They make the code more
concise, and ensure that clk_unprepare is called when clk_enable fails.

A simplified version of the semantic patch that introduces calls to these
functions is as follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e;
@@

- clk_prepare(e);
- clk_enable(e);
+ clk_prepare_enable(e);

@@
expression e;
@@

- clk_disable(e);
- clk_unprepare(e);
+ clk_disable_unprepare(e);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/watchdog/sp805_wdt.c |   11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/watchdog/sp805_wdt.c b/drivers/watchdog/sp805_wdt.c
index e4841c3..cabb040 100644
--- a/drivers/watchdog/sp805_wdt.c
+++ b/drivers/watchdog/sp805_wdt.c
@@ -130,16 +130,10 @@ static int wdt_config(struct watchdog_device *wdd, bool ping)
 	int ret;
 
 	if (!ping) {
-		ret = clk_prepare(wdt->clk);
-		if (ret) {
-			dev_err(&wdt->adev->dev, "clock prepare fail");
-			return ret;
-		}
 
-		ret = clk_enable(wdt->clk);
+		ret = clk_prepare_enable(wdt->clk);
 		if (ret) {
 			dev_err(&wdt->adev->dev, "clock enable fail");
-			clk_unprepare(wdt->clk);
 			return ret;
 		}
 	}
@@ -190,8 +184,7 @@ static int wdt_disable(struct watchdog_device *wdd)
 	readl_relaxed(wdt->base + WDTLOCK);
 	spin_unlock(&wdt->lock);
 
-	clk_disable(wdt->clk);
-	clk_unprepare(wdt->clk);
+	clk_disable_unprepare(wdt->clk);
 
 	return 0;
 }

