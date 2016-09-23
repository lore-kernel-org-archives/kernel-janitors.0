From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 23 Sep 2016 21:06:26 +0000
Subject: [PATCH] drm/nouveau/secboot/gm20b: Fix return value in case of error
Message-Id: <1474664786-30107-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bskeggs@redhat.com, airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

If 'ioremap()' returns 0, 'gm20b_tegra_read_wpr()' will return 0 as well,
which means success.
Return -ENOMEM instead

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Not sure that -ENOMEM is the best value.
I've taken it because it is often used in such a case.
---
 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
index d5395ebfe8d3..d88db933b3fd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
@@ -142,7 +142,7 @@ gm20b_tegra_read_wpr(struct gm200_secboot *gsb)
 	mc = ioremap(TEGRA_MC_BASE, 0xd00);
 	if (!mc) {
 		nvkm_error(&sb->subdev, "Cannot map Tegra MC registers\n");
-		return PTR_ERR(mc);
+		return -ENOMEM;
 	}
 	gsb->wpr_addr = ioread32_native(mc + MC_SECURITY_CARVEOUT2_BOM_0) |
 	      ((u64)ioread32_native(mc + MC_SECURITY_CARVEOUT2_BOM_HI_0) << 32);
-- 
2.7.4

