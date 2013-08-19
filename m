From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Mon, 19 Aug 2013 08:51:52 +0000
Subject: [PATCH 2/6] watchdog: simplify platform_get_resource_byname/devm_ioremap_resource
Message-Id: <1376902316-18520-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376902316-18520-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1376902316-18520-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wim Van Sebroeck <wim@iguana.be>
Cc: kernel-janitors@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Remove unneeded error handling on the result of a call to
platform_get_resource_byname when the value is passed to devm_ioremap_resource.

A simplified version of the semantic patch that makes this change is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression pdev,res,e,e1;
expression ret != 0;
identifier l;
@@

  res = platform_get_resource_byname(...);
- if (res = NULL) { ... \(goto l;\|return ret;\) }
  e = devm_ioremap_resource(e1, res);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/watchdog/ar7_wdt.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/watchdog/ar7_wdt.c b/drivers/watchdog/ar7_wdt.c
index 2f3cc8f..b3709f9 100644
--- a/drivers/watchdog/ar7_wdt.c
+++ b/drivers/watchdog/ar7_wdt.c
@@ -280,11 +280,6 @@ static int ar7_wdt_probe(struct platform_device *pdev)
 
 	ar7_regs_wdt  		platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
-	if (!ar7_regs_wdt) {
-		pr_err("could not get registers resource\n");
-		return -ENODEV;
-	}
-
 	ar7_wdt = devm_ioremap_resource(&pdev->dev, ar7_regs_wdt);
 	if (IS_ERR(ar7_wdt))
 		return PTR_ERR(ar7_wdt);

