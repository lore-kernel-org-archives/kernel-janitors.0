From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 07:28:00 +0000
Subject: [PATCH 4/5] GPU-DRM-nouveau: Adjust a kzalloc() call in gt215_ram_new()
Message-Id: <0d8628f4-7254-2600-9ee4-e72b4e0ee6f6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5bcff2ec-f3bd-ab9c-e13d-3a4f5cf7c73b@users.sourceforge.net>
In-Reply-To: <5bcff2ec-f3bd-ab9c-e13d-3a4f5cf7c73b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Martin Peres <martin.peres@free.fr>, Roy Spliet <rspliet@eclipso.eu>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 08:44:38 +0200

The script "checkpatch.pl" can point out that assignments should usually
not be performed within condition checks.
Thus move the assignment for one local variable to a separate statement
in this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
index cb50539..edbe8e4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
@@ -940,7 +940,8 @@ gt215_ram_new(struct nvkm_fb *fb, struct nvkm_ram **pram)
 	struct gt215_ram *ram;
 	int ret, i;
 
-	if (!(ram = kzalloc(sizeof(*ram), GFP_KERNEL)))
+	ram = kzalloc(sizeof(*ram), GFP_KERNEL);
+	if (!ram)
 		return -ENOMEM;
 	*pram = &ram->base;
 
-- 
2.10.0

