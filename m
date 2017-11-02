From: Colin King <colin.king@canonical.com>
Date: Thu, 02 Nov 2017 18:48:12 +0000
Subject: [PATCH] drm/nouveau/bios: make const arrays hwsq_signature and edid_sig static
Message-Id: <20171102184812.15263-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate arrays hwsq_signature and edid_sig on the stack but
instead make them static. Makes the object code smaller by over 190
bytes:

Before:
   text    data     bss     dec     hex filename
  35676    3312      64   39052    988c nouveau_bios.o

After:
   text    data     bss     dec     hex filename
  35319    3472      64   38855    97c7 nouveau_bios.o

(gcc version 7.2.0 x86_64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index dd6fba55ad5d..18c5f5874239 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -1964,7 +1964,7 @@ static int load_nv17_hw_sequencer_ucode(struct drm_device *dev,
 	 * The microcode entries are found by the "HWSQ" signature.
 	 */
 
-	const uint8_t hwsq_signature[] = { 'H', 'W', 'S', 'Q' };
+	static const uint8_t hwsq_signature[] = { 'H', 'W', 'S', 'Q' };
 	const int sz = sizeof(hwsq_signature);
 	int hwsq_offset;
 
@@ -1980,7 +1980,7 @@ uint8_t *nouveau_bios_embedded_edid(struct drm_device *dev)
 {
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvbios *bios = &drm->vbios;
-	const uint8_t edid_sig[] = {
+	static const uint8_t edid_sig[] = {
 			0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00 };
 	uint16_t offset = 0;
 	uint16_t newoffset;
-- 
2.14.1

