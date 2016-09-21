From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 07:26:48 +0000
Subject: [PATCH 3/5] GPU-DRM-nouveau: Delete unnecessary braces
Message-Id: <74cc2e34-cb5f-e3c9-e6cd-aa24ed3529e3@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5bcff2ec-f3bd-ab9c-e13d-3a4f5cf7c73b@users.sourceforge.net>
In-Reply-To: <5bcff2ec-f3bd-ab9c-e13d-3a4f5cf7c73b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Martin Peres <martin.peres@free.fr>, Roy Spliet <rspliet@eclipso.eu>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 21 Sep 2016 08:28:08 +0200

Do not use curly brackets at four source code places
where a single statement should be sufficient.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
index dbaf577..cb50539 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fb/ramgt215.c
@@ -127,12 +127,11 @@ gt215_link_train_calc(u32 *vals, struct gt215_ltrain *train)
 	}
 
 	/* Find the best value for 0x1111e0 */
-	for (i = 0; i < 4; i++) {
+	for (i = 0; i < 4; i++)
 		if (bins[i] > qty) {
 			bin = i + 3;
 			qty = bins[i];
 		}
-	}
 
 	train->r_100720 = 0;
 	for (i = 0; i < 8; i++) {
@@ -729,9 +728,8 @@ gt215_ram_calc(struct nvkm_ram *base, u32 freq)
 		ram_mask(fuc, 0x1007e0, 0x22222222, r100760);
 	}
 
-	if (device->chipset = 0xa3 && freq > 500000) {
+	if (device->chipset = 0xa3 && freq > 500000)
 		ram_mask(fuc, 0x100700, 0x00000006, 0x00000000);
-	}
 
 	/* Final switch */
 	if (mclk.pll) {
@@ -745,12 +743,11 @@ gt215_ram_calc(struct nvkm_ram *base, u32 freq)
 	ram_nsec(fuc, 2000);
 
 	/* Set RAM MR parameters and timings */
-	for (i = 2; i >= 0; i--) {
+	for (i = 2; i >= 0; i--)
 		if (ram_rd32(fuc, mr[i]) != ram->base.mr[i]) {
 			ram_wr32(fuc, mr[i], ram->base.mr[i]);
 			ram_nsec(fuc, 1000);
 		}
-	}
 
 	ram_wr32(fuc, 0x100220[3], timing[3]);
 	ram_wr32(fuc, 0x100220[1], timing[1]);
@@ -838,11 +835,10 @@ gt215_ram_calc(struct nvkm_ram *base, u32 freq)
 	if (!next->bios.ramcfg_DLLoff)
 		nvkm_sddr2_dll_reset(fuc);
 
-	if (ram->base.type = NVKM_RAM_TYPE_GDDR3) {
+	if (ram->base.type = NVKM_RAM_TYPE_GDDR3)
 		ram_nsec(fuc, 31000);
-	} else {
+	else
 		ram_nsec(fuc, 14000);
-	}
 
 	if (ram->base.type = NVKM_RAM_TYPE_DDR3) {
 		ram_wr32(fuc, 0x100264, 0x1);
-- 
2.10.0

