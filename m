From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jan 2012 07:20:47 +0000
Subject: [patch] drm/nv50/pm: signedness bug in nv50_pm_clocks_pre()
Message-Id: <20120104072047.GE30978@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, Emil Velikov <emil.l.velikov@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, Martin Peres <martin.peres@ensi-bourges.fr>

calc_mclk() returns zero on success and negative on failure but clk is
a u32.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/nouveau/nv50_pm.c b/drivers/gpu/drm/nouveau/nv50_pm.c
index 0393721..3508de9 100644
--- a/drivers/gpu/drm/nouveau/nv50_pm.c
+++ b/drivers/gpu/drm/nouveau/nv50_pm.c
@@ -540,7 +540,7 @@ nv50_pm_clocks_pre(struct drm_device *dev, struct nouveau_pm_level *perflvl)
 	info->mclk_hwsq.len = 0;
 	if (perflvl->memory) {
 		clk = calc_mclk(dev, perflvl->memory, &info->mclk_hwsq);
-		if (clk < 0) {
+		if ((int)clk < 0) {
 			ret = clk;
 			goto error;
 		}
