From: Julia Lawall <julia@diku.dk>
Date: Mon, 26 Dec 2011 17:38:00 +0000
Subject: [PATCH 1/2] drivers/watchdog/lantiq_wdt.c: drop iounmap for devm_ allocated data
Message-Id: <1324921081-13161-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wim Van Sebroeck <wim@iguana.be>
Cc: kernel-janitors@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Data allocated with devm_ioremap or devm_ioremap_nocache should not be
freed using iounmap, because doing so causes a dangling pointer, and a
subsequent double free.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
expression x;
@@
(
 x = devm_ioremap(...)
|
 x = devm_ioremap_nocache(...)
)

@@
expression r.x;
@@
* iounmap(x)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/watchdog/lantiq_wdt.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/watchdog/lantiq_wdt.c b/drivers/watchdog/lantiq_wdt.c
index 102aed0..d3a63be 100644
--- a/drivers/watchdog/lantiq_wdt.c
+++ b/drivers/watchdog/lantiq_wdt.c
@@ -222,9 +222,6 @@ ltq_wdt_remove(struct platform_device *pdev)
 {
 	misc_deregister(&ltq_wdt_miscdev);
 
-	if (ltq_wdt_membase)
-		iounmap(ltq_wdt_membase);
-
 	return 0;
 }
 

