From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 21 Feb 2019 03:38:51 +0000
Subject: [PATCH -next] drm/nouveau/dmem: remove set but not used variable 'drm'
Message-Id: <20190221033851.70331-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/nouveau/nouveau_dmem.c: In function 'nouveau_dmem_free':
drivers/gpu/drm/nouveau/nouveau_dmem.c:103:22: warning:
 variable 'drm' set but not used [-Wunused-but-set-variable]
  struct nouveau_drm *drm;
                      ^

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index aa9fec80492d..900a302b7ce9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -100,12 +100,10 @@ static void
 nouveau_dmem_free(struct hmm_devmem *devmem, struct page *page)
 {
 	struct nouveau_dmem_chunk *chunk;
-	struct nouveau_drm *drm;
 	unsigned long idx;
 
 	chunk = (void *)hmm_devmem_page_get_drvdata(page);
 	idx = page_to_pfn(page) - chunk->pfn_first;
-	drm = chunk->drm;
 
 	/*
 	 * FIXME:
