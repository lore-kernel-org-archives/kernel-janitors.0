From: Julia Lawall <julia@diku.dk>
Date: Fri, 14 Nov 2008 18:06:03 +0000
Subject: [PATCH 2/3] drivers/video/backlight/da903x.c: introduce missing
Message-Id: <Pine.LNX.4.64.0811141905330.10023@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rpurdie@linux.intel.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Error handling code following a kzalloc should free the allocated data.

The semantic match that finds the problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
statement S;
expression E;
identifier f,l;
position p1,p2;
expression *ptr != NULL;
@@

(
if ((x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...)) = NULL) S
|
x@p1 = \(kmalloc\|kzalloc\|kcalloc\)(...);
...
if (x = NULL) S
)
<... when != x
     when != if (...) { <+...x...+> }
x->f = E
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
 drivers/video/backlight/da903x.c    |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/video/backlight/da903x.c b/drivers/video/backlight/da903x.c
index 242c382..75388b9 100644
--- a/drivers/video/backlight/da903x.c
+++ b/drivers/video/backlight/da903x.c
@@ -119,6 +119,7 @@ static int da903x_backlight_probe(struct platform_device *pdev)
 	default:
 		dev_err(&pdev->dev, "invalid backlight device ID(%d)\n",
 				pdev->id);
+		kfree(data);
 		return -EINVAL;
 	}
 
