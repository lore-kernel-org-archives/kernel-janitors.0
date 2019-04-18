From: Colin King <colin.king@canonical.com>
Date: Thu, 18 Apr 2019 16:53:45 +0000
Subject: [PATCH] drm/nouveau/fb/ramgk104: fix spelling mistake "sucessfully" -> "successfully"
Message-Id: <20190418165345.20909-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a nvkm_debug message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
index 8bcb7e79a0cb..456aed1f2a02 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgk104.c
@@ -1070,7 +1070,7 @@ gk104_ram_calc_xits(struct gk104_ram *ram, struct nvkm_ram_data *next)
 			nvkm_error(subdev, "unable to calc plls\n");
 			return -EINVAL;
 		}
-		nvkm_debug(subdev, "sucessfully calced PLLs for clock %i kHz"
+		nvkm_debug(subdev, "successfully calced PLLs for clock %i kHz"
 				" (refclock: %i kHz)\n", next->freq, ret);
 	} else {
 		/* calculate refpll coefficients */
-- 
2.20.1
