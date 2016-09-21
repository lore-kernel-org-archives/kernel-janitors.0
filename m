From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 07:25:51 +0000
Subject: [PATCH 2/5] GPU-DRM-nouveau: Use kmalloc_array() in gt215_link_train()
Message-Id: <6fcf1d5f-73eb-9107-dc1f-be03a5fef271@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5bcff2ec-f3bd-ab9c-e13d-3a4f5cf7c73b@users.sourceforge.net>
In-Reply-To: <5bcff2ec-f3bd-ab9c-e13d-3a4f5cf7c73b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Martin Peres <martin.peres@free.fr>, Roy Spliet <rspliet@eclipso.eu>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 20 Sep 2016 22:32:14 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
index d15ea88..dbaf577 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
@@ -170,7 +170,7 @@ gt215_link_train(struct gt215_ram *ram)
 		return -ENOSYS;
 
 	/* XXX: Multiple partitions? */
-	result = kmalloc(64 * sizeof(u32), GFP_KERNEL);
+	result = kmalloc_array(64, sizeof(*result), GFP_KERNEL);
 	if (!result)
 		return -ENOMEM;
 
-- 
2.10.0

