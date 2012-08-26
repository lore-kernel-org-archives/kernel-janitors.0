From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 26 Aug 2012 16:01:04 +0000
Subject: [PATCH 12/13] drivers/amba/bus.c: use clk_prepare_enable and clk_disable_unprepare
Message-Id: <1345996865-32082-13-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1345996865-32082-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1345996865-32082-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell King <linux@arm.linux.org.uk>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

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
 drivers/amba/bus.c |   15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/amba/bus.c b/drivers/amba/bus.c
index e8eb91b..6374ee6 100644
--- a/drivers/amba/bus.c
+++ b/drivers/amba/bus.c
@@ -329,17 +329,9 @@ static int amba_get_enable_pclk(struct amba_device *pcdev)
 	if (IS_ERR(pclk))
 		return PTR_ERR(pclk);
 
-	ret = clk_prepare(pclk);
-	if (ret) {
-		clk_put(pclk);
-		return ret;
-	}
-
-	ret = clk_enable(pclk);
-	if (ret) {
-		clk_unprepare(pclk);
+	ret = clk_prepare_enable(pclk);
+	if (ret)
 		clk_put(pclk);
-	}
 
 	return ret;
 }
@@ -348,8 +340,7 @@ static void amba_put_disable_pclk(struct amba_device *pcdev)
 {
 	struct clk *pclk = pcdev->pclk;
 
-	clk_disable(pclk);
-	clk_unprepare(pclk);
+	clk_disable_unprepare(pclk);
 	clk_put(pclk);
 }
 

