From: Julia Lawall <julia@diku.dk>
Date: Wed, 10 Dec 2008 16:36:08 +0000
Subject: [PATCH 12/28] drivers/block: Drop return value from platform_driver
Message-Id: <Pine.LNX.4.64.0812101735490.21998@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmitri.vorobiev@movial.fi, axboe@kernel.dk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 drivers/block/xsysace.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/block/xsysace.c b/drivers/block/xsysace.c
index 29e1dfa..f28505e 100644
--- a/drivers/block/xsysace.c
+++ b/drivers/block/xsysace.c
@@ -1142,15 +1142,14 @@ static int __devinit ace_probe(struct platform_device *dev)
 /*
  * Platform bus remove() method
  */
-static int __devexit ace_remove(struct platform_device *dev)
+static void __devexit ace_remove(struct platform_device *dev)
 {
 	ace_free(&dev->dev);
-	return 0;
 }
 
 static struct platform_driver ace_platform_driver = {
 	.probe = ace_probe,
-	.remove = __devexit_p(ace_remove),
+	.remove_new = __devexit_p(ace_remove),
 	.driver = {
 		.owner = THIS_MODULE,
 		.name = "xsysace",
