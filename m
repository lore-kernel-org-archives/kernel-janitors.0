From: Julia Lawall <julia@diku.dk>
Date: Sat, 01 Aug 2009 08:55:24 +0000
Subject: [PATCH 9/10] drivers/ata: introduce missing kfree
Message-Id: <Pine.LNX.4.64.0908011055050.23408@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jgarzik@pobox.com, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 drivers/ata/pata_at91.c             |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/ata/pata_at91.c b/drivers/ata/pata_at91.c
index 5702aff..46fb883 100644
--- a/drivers/ata/pata_at91.c
+++ b/drivers/ata/pata_at91.c
@@ -261,7 +261,8 @@ static int __devinit pata_at91_probe(struct platform_device *pdev)
 
 	if (IS_ERR(info->mck)) {
 		dev_err(dev, "failed to get access to mck clock\n");
-		return -ENODEV;
+		ret = -ENODEV;
+		goto err_clk_get;
 	}
 
 	info->cs    = board->chipselect;
@@ -308,6 +309,7 @@ err_alt_ioremap:
 
 err_ide_ioremap:
 	clk_put(info->mck);
+err_clk_get:
 	kfree(info);
 
 	return ret;
