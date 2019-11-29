From: Colin King <colin.king@canonical.com>
Date: Fri, 29 Nov 2019 16:28:28 +0000
Subject: [PATCH] nouveau: fix incorrect sizeof on args.src an args.dst
Message-Id: <20191129162828.84570-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Jason Gunthorpe <jgg-uk2M96/98Pc@public.gmane.org>, Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Colin Ian King <colin.king@canonical.com>

The sizeof is currently on args.src and args.dst and should be on
*args.src and *args.dst. Fortunately these sizes just so happen
to be the same size so it worked, however, this should be fixed
and it also cleans up static analysis warnings

Addresses-Coverity: ("sizeof not portable")
Fixes: f268307ec7c7 ("nouveau: simplify nouveau_dmem_migrate_vma")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index fa1439941596..0ad5d87b5a8e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -635,10 +635,10 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	unsigned long c, i;
 	int ret = -ENOMEM;
 
-	args.src = kcalloc(max, sizeof(args.src), GFP_KERNEL);
+	args.src = kcalloc(max, sizeof(*args.src), GFP_KERNEL);
 	if (!args.src)
 		goto out;
-	args.dst = kcalloc(max, sizeof(args.dst), GFP_KERNEL);
+	args.dst = kcalloc(max, sizeof(*args.dst), GFP_KERNEL);
 	if (!args.dst)
 		goto out_free_src;
 
-- 
2.24.0
