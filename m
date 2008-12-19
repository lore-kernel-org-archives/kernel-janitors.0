From: Julia Lawall <julia@diku.dk>
Date: Fri, 19 Dec 2008 17:10:23 +0000
Subject: [PATCH 1/3] drivers/gpu/drm: Move a dereference below a NULL test
Message-Id: <Pine.LNX.4.64.0812191809490.11217@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: airlied@linux.ie, dri-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If the NULL test is necessary, then the dereference should be moved below
the NULL test.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/).  The result has been modified to
move the initialization of driver down closer to where it is used.

// <smpl>
@@
type T;
expression E;
identifier i,fld;
statement S;
@@

- T i = E->fld;
+ T i;
  ... when != E
      when != i
  if (E = NULL) S
+ i = E->fld;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/gpu/drm/drm_drv.c |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 0b9f316..4bdfc98 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -297,7 +297,7 @@ EXPORT_SYMBOL(drm_init);
  */
 static void drm_cleanup(struct drm_device * dev)
 {
-	struct drm_driver *driver = dev->driver;
+	struct drm_driver *driver;
 
 	DRM_DEBUG("\n");
 
@@ -324,8 +324,9 @@ static void drm_cleanup(struct drm_device * dev)
 		dev->agp = NULL;
 	}
 
-	if (dev->driver->unload)
-		dev->driver->unload(dev);
+	driver = dev->driver;
+	if (driver->unload)
+		driver->unload(dev);
 
 	drm_ht_remove(&dev->map_hash);
 	drm_ctxbitmap_cleanup(dev);
