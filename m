From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 07:29:18 +0000
Subject: [PATCH 5/5] GPU-DRM-nouveau: Add space after an "if"
Message-Id: <d0a1b7f9-5fb1-fcb5-abc7-ffd03ef01086@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5bcff2ec-f3bd-ab9c-e13d-3a4f5cf7c73b@users.sourceforge.net>
In-Reply-To: <5bcff2ec-f3bd-ab9c-e13d-3a4f5cf7c73b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Martin Peres <martin.peres@free.fr>, Roy Spliet <rspliet@eclipso.eu>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 08:58:41 +0200

Use another space character behind the keyword "if" according to
the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
index edbe8e4..f95800d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
@@ -256,7 +256,7 @@ gt215_link_train(struct gt215_ram *ram)
 	return ret;
 
 out:
-	if(ret = -EBUSY)
+	if (ret = -EBUSY)
 		f = NULL;
 
 	train->state = NVA3_TRAIN_UNSUPPORTED;
-- 
2.10.0

