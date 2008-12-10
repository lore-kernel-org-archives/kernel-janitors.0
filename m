From: Julia Lawall <julia@diku.dk>
Date: Wed, 10 Dec 2008 16:35:48 +0000
Subject: [PATCH 11/28] drivers/cdrom: Drop return value from platform_driver
Message-Id: <Pine.LNX.4.64.0812101735260.21998@ask.diku.dk>
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
 drivers/cdrom/gdrom.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c
index 2eecb77..9aaec3c 100644
--- a/drivers/cdrom/gdrom.c
+++ b/drivers/cdrom/gdrom.c
@@ -826,7 +826,7 @@ probe_fail_no_mem:
 	return err;
 }
 
-static int __devexit remove_gdrom(struct platform_device *devptr)
+static void __devexit remove_gdrom(struct platform_device *devptr)
 {
 	flush_scheduled_work();
 	blk_cleanup_queue(gd.gdrom_rq);
@@ -836,13 +836,11 @@ static int __devexit remove_gdrom(struct platform_device *devptr)
 	if (gdrom_major)
 		unregister_blkdev(gdrom_major, GDROM_DEV_NAME);
 	unregister_cdrom(gd.cd_info);
-
-	return 0;
 }
 
 static struct platform_driver gdrom_driver = {
 	.probe = probe_gdrom,
-	.remove = __devexit_p(remove_gdrom),
+	.remove_new = __devexit_p(remove_gdrom),
 	.driver = {
 			.name = GDROM_DEV_NAME,
 	},
