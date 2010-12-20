From: Dan Carpenter <error27@gmail.com>
Date: Mon, 20 Dec 2010 09:26:26 +0000
Subject: [patch -next] nouveua: sizeof() vs ARRAY_SIZE()
Message-Id: <20101220092626.GT1936@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org

ARRAY_SIZE() was intended here, sizeof() is too large.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/gpu/drm/nouveau/nv50_vram.c b/drivers/gpu/drm/nouveau/nv50_vram.c
index 47489ed..58e98ad 100644
--- a/drivers/gpu/drm/nouveau/nv50_vram.c
+++ b/drivers/gpu/drm/nouveau/nv50_vram.c
@@ -42,7 +42,7 @@ nv50_vram_flags_valid(struct drm_device *dev, u32 tile_flags)
 {
 	int type = (tile_flags & NOUVEAU_GEM_TILE_LAYOUT_MASK) >> 8;
 
-	if (likely(type < sizeof(types) && types[type]))
+	if (likely(type < ARRAY_SIZE(types) && types[type]))
 		return true;
 	return false;
 }
