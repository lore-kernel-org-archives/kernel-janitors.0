From: Julia Lawall <julia@diku.dk>
Date: Sat, 21 Nov 2009 11:52:17 +0000
Subject: [PATCH 6/8] drivers/usb/host/ehci-omap.c: introduce missing kfree
Message-Id: <Pine.LNX.4.64.0911211251480.23681@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dbrownell@users.sourceforge.net, Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Error handling code following a kzalloc should free the allocated data.

The semantic match that finds this problem is as follows:
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
 drivers/usb/host/ehci-omap.c        |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/host/ehci-omap.c b/drivers/usb/host/ehci-omap.c
index 7ba8df3..12f1ad2 100644
--- a/drivers/usb/host/ehci-omap.c
+++ b/drivers/usb/host/ehci-omap.c
@@ -558,7 +558,7 @@ static int ehci_hcd_omap_probe(struct platform_device *pdev)
 	omap = kzalloc(sizeof(*omap), GFP_KERNEL);
 	if (!omap) {
 		ret = -ENOMEM;
-		goto err_create_hcd;
+		goto err_disabled;
 	}
 
 	hcd = usb_create_hcd(&ehci_omap_hc_driver, &pdev->dev,
@@ -653,6 +653,7 @@ err_ioremap:
 	usb_put_hcd(hcd);
 
 err_create_hcd:
+	kfree(omap);
 err_disabled:
 err_pdata:
 	return ret;
