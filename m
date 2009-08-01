From: Julia Lawall <julia@diku.dk>
Date: Sat, 01 Aug 2009 08:53:38 +0000
Subject: [PATCH 3/10] drivers/media/video/gspca: introduce missing kfree
Message-Id: <Pine.LNX.4.64.0908011053140.23408@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: frank@zago.net, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Error handling code following a kmalloc should free the allocated data.

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
 drivers/media/video/gspca/m5602/m5602_s5k83a.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/media/video/gspca/m5602/m5602_s5k83a.c b/drivers/media/video/gspca/m5602/m5602_s5k83a.c
index 7127321..6b89f33 100644
--- a/drivers/media/video/gspca/m5602/m5602_s5k83a.c
+++ b/drivers/media/video/gspca/m5602/m5602_s5k83a.c
@@ -178,8 +178,10 @@ sensor_found:
 
 	sens_priv->settings  	kmalloc(sizeof(s32)*ARRAY_SIZE(s5k83a_ctrls), GFP_KERNEL);
-	if (!sens_priv->settings)
+	if (!sens_priv->settings) {
+		kfree(sens_priv);
 		return -ENOMEM;
+	}
 
 	sd->gspca_dev.cam.cam_mode = s5k83a_modes;
 	sd->gspca_dev.cam.nmodes = ARRAY_SIZE(s5k83a_modes);
