From: Colin King <colin.king@canonical.com>
Date: Wed, 07 Jun 2017 11:35:17 +0000
Subject: [PATCH][drm-next] drm/nouveau: fix non-ANSI function declaration of nouveau_pmops_runtime
Message-Id: <20170607113517.29270-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Give function nouveau_pmops_runtime a void argument to make it an ANSI
function declaration. Fixes sparse warning:

warning: non-ANSI function declaration of function 'nouveau_pmops_runtime'

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 7acd1cf8c5a6..90757af9bc73 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -727,7 +727,7 @@ nouveau_pmops_thaw(struct device *dev)
 }
 
 bool
-nouveau_pmops_runtime()
+nouveau_pmops_runtime(void)
 {
 	if (nouveau_runtime_pm = -1)
 		return nouveau_is_optimus() || nouveau_is_v1_dsm();
-- 
2.11.0

