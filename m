From: Julia Lawall <julia@diku.dk>
Date: Tue, 27 Dec 2011 14:01:29 +0000
Subject: [PATCH 4/6] drivers/watchdog/dw_wdt.c: use devm_request_and_ioremap
Message-Id: <1324994491-21828-5-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1324994491-21828-1-git-send-email-julia@diku.dk>
In-Reply-To: <1324994491-21828-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wim Van Sebroeck <wim@iguana.be>
Cc: kernel-janitors@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Reimplement a call to devm_request_mem_region followed by a call to ioremap
or ioremap_nocache by a call to devm_request_and_ioremap.

The semantic patch that makes this transformation is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@nm@
expression myname;
identifier i;
@@

struct platform_driver i = { .driver = { .name = myname } };

@@
expression dev,res,size;
expression nm.myname;
@@

-if (!devm_request_mem_region(dev, res->start, size,
-                              \(res->name\|dev_name(dev)\|myname\))) {
-   ...
-   return ...;
-}
... when != res->start
(
-devm_ioremap(dev,res->start,size)
+devm_request_and_ioremap(dev,res)
|
-devm_ioremap_nocache(dev,res->start,size)
+devm_request_and_ioremap(dev,res)
)
... when any
    when != res->start
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/watchdog/dw_wdt.c |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index 1b0e3dd..63d7b58 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -300,11 +300,7 @@ static int __devinit dw_wdt_drv_probe(struct platform_device *pdev)
 	if (!mem)
 		return -EINVAL;
 
-	if (!devm_request_mem_region(&pdev->dev, mem->start, resource_size(mem),
-				     "dw_wdt"))
-		return -ENOMEM;
-
-	dw_wdt.regs = devm_ioremap(&pdev->dev, mem->start, resource_size(mem));
+	dw_wdt.regs = devm_request_and_ioremap(&pdev->dev, mem);
 	if (!dw_wdt.regs)
 		return -ENOMEM;
 

