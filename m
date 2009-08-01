From: Julia Lawall <julia@diku.dk>
Date: Sat, 01 Aug 2009 08:54:00 +0000
Subject: [PATCH 5/10] drivers/rtc: introduce missing kfree
Message-Id: <Pine.LNX.4.64.0908011053390.23408@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: p_gortmaker@yahoo.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Error handling code following a kzalloc should free the allocated data.

The semantic match that finds the problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
statement S;
expression E;
identifier f,f1,l;
position p1,p2;
expression *ptr != NULL;
@@

x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
...
if (x = NULL) S
<... when != x
     when != if (...) { <+...x...+> }
(
x->f1 = E
|
 (x->f1 = NULL || ...)
|
 f(...,x->f1,...)
)
...>
(
 return \(0\|<+...x...+>\|ptr\);
|
 return@p2 ...;
)

@script:python@
p1 << r.p1;
p2 << r.p2;
@@

print "* file: %s kmalloc %s return %s" % (p1[0].file,p1[0].line,p2[0].line)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>
---
 drivers/rtc/rtc-ep93xx.c            |   14 ++++++++++----
 1 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-ep93xx.c b/drivers/rtc/rtc-ep93xx.c
index 551332e..9da02d1 100644
--- a/drivers/rtc/rtc-ep93xx.c
+++ b/drivers/rtc/rtc-ep93xx.c
@@ -128,12 +128,16 @@ static int __init ep93xx_rtc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (res = NULL)
-		return -ENXIO;
+	if (res = NULL) {
+		err = -ENXIO;
+		goto fail_free;
+	}
 
 	res = request_mem_region(res->start, resource_size(res), pdev->name);
-	if (res = NULL)
-		return -EBUSY;
+	if (res = NULL) {
+		err = -EBUSY;
+		goto fail_free;
+	}
 
 	ep93xx_rtc->mmio_base = ioremap(res->start, resource_size(res));
 	if (ep93xx_rtc->mmio_base = NULL) {
@@ -169,6 +173,8 @@ fail:
 		pdev->dev.platform_data = NULL;
 	}
 	release_mem_region(res->start, resource_size(res));
+fail_free:
+	kfree(ep93xx_rtc);
 	return err;
 }
 
