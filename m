From: Julia Lawall <julia@diku.dk>
Date: Sun, 19 Jul 2009 15:25:52 +0000
Subject: [PATCH 2/10] drivers/gpu/drm: Move a dereference below a NULL test
Message-Id: <Pine.LNX.4.64.0907191725290.16542@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: airlied@linux.ie, dri-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If the NULL test is necessary, then the dereference should be moved below
the NULL test.

In the case of drivers/gpu/drm/i915/i915_drv.c, the variable dev_priv
whose initialization causes the problem is never used in the function, so
it is dropped.

Dropped some extra braces in drivers/gpu/drm/radeon/radeon_device.c

A simplified version of the semantic patch that makes this change is as
follows: (http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
type T;
expression E,E1;
identifier i,fld;
statement S;
@@

- T i =3D E->fld;
+ T i;
  ... when !=3D E=E1
      when !=3D i
  if (E =3D NULL||...) S
+ i =3D E->fld;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/gpu/drm/drm_stub.c             |    3 ++-
 drivers/gpu/drm/i915/i915_drv.c        |    7 +++----
 drivers/gpu/drm/radeon/radeon_device.c |   12 +++++-------
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_stub.c b/drivers/gpu/drm/drm_stub.c
index 155a5bb..55bb8a8 100644
--- a/drivers/gpu/drm/drm_stub.c
+++ b/drivers/gpu/drm/drm_stub.c
@@ -489,7 +489,7 @@ int drm_put_minor(struct drm_minor **minor_p)
  */
 void drm_put_dev(struct drm_device *dev)
 {
-	struct drm_driver *driver =3D dev->driver;
+	struct drm_driver *driver;
 	struct drm_map_list *r_list, *list_temp;
=20
 	DRM_DEBUG("\n");
@@ -498,6 +498,7 @@ void drm_put_dev(struct drm_device *dev)
 		DRM_ERROR("cleanup called no dev\n");
 		return;
 	}
+	driver =3D dev->driver;
=20
 	drm_vblank_cleanup(dev);
=20
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_dr=
v.c
index fc4b68a..726b241 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -55,10 +55,9 @@ MODULE_DEVICE_TABLE(pci, pciidlist);
=20
 static int i915_suspend(struct drm_device *dev, pm_message_t state)
 {
-	struct drm_i915_private *dev_priv =3D dev->dev_private;
-
-	if (!dev || !dev_priv) {
-		DRM_ERROR("dev: %p, dev_priv: %p\n", dev, dev_priv);
+	if (!dev || !dev->dev_private) {
+		DRM_ERROR("dev: %p, dev_priv: %p\n",
+				dev, dev ? dev->dev_private : NULL);
 		DRM_ERROR("DRM not initialized, aborting suspend.\n");
 		return -ENODEV;
 	}
diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeo=
n/radeon_device.c
index f97563d..a9571a4 100644
--- a/drivers/gpu/drm/radeon/radeon_device.c
+++ b/drivers/gpu/drm/radeon/radeon_device.c
@@ -671,23 +671,21 @@ void radeon_device_fini(struct radeon_device *rdev)
  */
 int radeon_suspend_kms(struct drm_device *dev, pm_message_t state)
 {
-	struct radeon_device *rdev =3D dev->dev_private;
+	struct radeon_device *rdev;
 	struct drm_crtc *crtc;
=20
-	if (dev =3D NULL || rdev =3D NULL) {
+	if (dev =3D NULL || dev->dev_private =3D NULL)
 		return -ENODEV;
-	}
-	if (state.event =3D PM_EVENT_PRETHAW) {
+	rdev =3D dev->dev_private;
+	if (state.event =3D PM_EVENT_PRETHAW)
 		return 0;
-	}
 	/* unpin the front buffers */
 	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
 		struct radeon_framebuffer *rfb =3D to_radeon_framebuffer(crtc->fb);
 		struct radeon_object *robj;
=20
-		if (rfb =3D NULL || rfb->obj =3D NULL) {
+		if (rfb =3D NULL || rfb->obj =3D NULL)
 			continue;
-		}
 		robj =3D rfb->obj->driver_private;
 		if (robj !=3D rdev->fbdev_robj) {
 			radeon_object_unpin(robj);
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
