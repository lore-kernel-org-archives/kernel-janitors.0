From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 06:23:54 +0000
Subject: [PATCH 4/4] GPU-DRM-QXL: Adjust checks for null pointers in three functions
Message-Id: <0b282ff2-cafe-0b51-912f-def4d840c4ef@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ce810580-cc2b-32cc-a852-a355374c2100@users.sourceforge.net>
In-Reply-To: <ce810580-cc2b-32cc-a852-a355374c2100@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: dri-devel@lists.freedesktop.org, Bhaktipriya Shridhar <bhaktipriya96@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, David Airlie <airlied@linux.ie>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, Tejun Heo <tj@kernel.org>, Thierry Reding <treding@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 22 Sep 2016 08:00:08 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" can point information out like the following.

Comparison to NULL could be written !=E2=80=A6

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/qxl/qxl_kms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_kms.c b/drivers/gpu/drm/qxl/qxl_kms.c
index f8f0261..f594430 100644
--- a/drivers/gpu/drm/qxl/qxl_kms.c
+++ b/drivers/gpu/drm/qxl/qxl_kms.c
@@ -149,7 +149,7 @@ static int qxl_device_init(struct qxl_device *qdev,
 			io_mapping_create_wc(qdev->surfaceram_base,
 					     qdev->surfaceram_size);
 	}
-	if (qdev->surface_mapping =3D NULL) {
+	if (!qdev->surface_mapping) {
 		/* 64bit surface bar not present (or mapping failed) */
 		sb =3D 1;
 		qdev->surfaceram_base =3D pci_resource_start(pdev, sb);
@@ -288,7 +288,7 @@ int qxl_driver_unload(struct drm_device *dev)
 {
 	struct qxl_device *qdev =3D dev->dev_private;
=20
-	if (qdev =3D NULL)
+	if (!qdev)
 		return 0;
=20
 	drm_vblank_cleanup(dev);
@@ -307,7 +307,7 @@ int qxl_driver_load(struct drm_device *dev, unsigned lo=
ng flags)
 	int r;
=20
 	qdev =3D kzalloc(sizeof(*qdev), GFP_KERNEL);
-	if (qdev =3D NULL)
+	if (!qdev)
 		return -ENOMEM;
=20
 	dev->dev_private =3D qdev;
--=20
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
