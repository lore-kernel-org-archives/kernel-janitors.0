From: Julia Lawall <julia@diku.dk>
Date: Wed, 10 Dec 2008 16:36:30 +0000
Subject: [PATCH 13/28] drivers/auxdisplay: Drop return value from platform_driver
Message-Id: <Pine.LNX.4.64.0812101736090.21998@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmitri.vorobiev@movial.fi, miguel.ojeda.sandonis@gmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The return value of the remove function of a driver structure, and thus of
a platform_driver structure, is ultimately ignored, and is thus
unnecessary.  This patch removes the return value for the remove function
stored in a platform_driver structure.  For the files in this patch, the
return values are always 0.

A simplified version of the semantic patch that makes this change is as
follows: (http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r@
struct platform_driver I;
identifier a,f;
position p;
@@
I.remove = \(f@p\|a(f@p)\);

@void_called@
identifier r.f;
position p;
@@
f@p(...);

@called@
identifier r.f;
position p1 != void_called.p;
@@
f@p1(...)

@localfn@
identifier r.f;
@@
static int f(...) { ... }

@depends on !called && localfn@
struct platform_driver I;
identifier a,f;
position r.p;
@@

I.
- remove
+ remove_new
   = \(f@p\|a(f@p)\);

@depends on !called && localfn@
identifier r.f,i;
constant C;
expression E;
@@

- int
+ void
       f(...) {
  <...
(
-  return \(C\|i\);
+  return;
|
-  return E;
+  E;
+  return;
)
  ...>
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/auxdisplay/cfag12864bfb.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/auxdisplay/cfag12864bfb.c b/drivers/auxdisplay/cfag12864bfb.c
index fe3a865..56a3d22 100644
--- a/drivers/auxdisplay/cfag12864bfb.c
+++ b/drivers/auxdisplay/cfag12864bfb.c
@@ -115,7 +115,7 @@ none:
 	return ret;
 }
 
-static int cfag12864bfb_remove(struct platform_device *device)
+static void cfag12864bfb_remove(struct platform_device *device)
 {
 	struct fb_info *info = platform_get_drvdata(device);
 
@@ -123,13 +123,11 @@ static int cfag12864bfb_remove(struct platform_device *device)
 		unregister_framebuffer(info);
 		framebuffer_release(info);
 	}
-
-	return 0;
 }
 
 static struct platform_driver cfag12864bfb_driver = {
 	.probe	= cfag12864bfb_probe,
-	.remove = cfag12864bfb_remove,
+	.remove_new = cfag12864bfb_remove,
 	.driver = {
 		.name	= CFAG12864BFB_NAME,
 	},
