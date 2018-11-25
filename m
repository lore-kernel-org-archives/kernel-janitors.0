From: Colin King <colin.king@canonical.com>
Date: Sun, 25 Nov 2018 17:09:18 +0000
Subject: [PATCH] drm/nouveau/bios/ramcfg: fix missing parentheses when calculating RON
Message-Id: <20181125170918.8088-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently, the expression for calculating RON is always going to result
in zero no matter the value of ram->mr[1] because the ! operator has
higher precedence than the shift >> operator.  I believe the missing
parentheses around the expression before appying the ! operator will
result in the desired result.

[ Note, not tested ]

Detected by CoveritScan, CID#1324005 ("Operands don't affect result")

Fixes: c25bf7b6155c ("drm/nouveau/bios/ramcfg: Separate out RON pull value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/gddr3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gddr3.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gddr3.c
index 60ece0a8a2e1..1d2d6bae73cd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gddr3.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/gddr3.c
@@ -87,7 +87,7 @@ nvkm_gddr3_calc(struct nvkm_ram *ram)
 		WR  = (ram->next->bios.timing[2] & 0x007f0000) >> 16;
 		/* XXX: Get these values from the VBIOS instead */
 		DLL = !(ram->mr[1] & 0x1);
-		RON = !(ram->mr[1] & 0x300) >> 8;
+		RON = !((ram->mr[1] & 0x300) >> 8);
 		break;
 	default:
 		return -ENOSYS;
-- 
2.19.1
