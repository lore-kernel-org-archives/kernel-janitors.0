From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 11 Mar 2018 22:32:03 +0000
Subject: [PATCH] drm: zte: Fix an error handling path in 'zx_crtc_bind()'
Message-Id: <20180311223203.3669-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: shawnguo@kernel.org, airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'ret' is known to be 0 at this point. It must be updated by the value
returned by 'clk_prepare_enable()'.

Fixes: 0a886f59528a ("drm: zte: add initial vou drm driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/zte/zx_vou.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/zte/zx_vou.c b/drivers/gpu/drm/zte/zx_vou.c
index 7491813131f3..3351b258ed7a 100644
--- a/drivers/gpu/drm/zte/zx_vou.c
+++ b/drivers/gpu/drm/zte/zx_vou.c
@@ -838,7 +838,7 @@ static int zx_crtc_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	clk_prepare_enable(vou->ppu_clk);
+	ret = clk_prepare_enable(vou->ppu_clk);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to enable ppu_clk: %d\n", ret);
 		goto disable_axi_clk;
-- 
2.14.1


---
L'absence de virus dans ce courrier électronique a été vérifiée par le logiciel antivirus Avast.
https://www.avast.com/antivirus

