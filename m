From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Jul 2018 12:30:56 +0000
Subject: [PATCH] drm/nouveau/gem: off by one bugs in nouveau_gem_pushbuf_reloc_apply()
Message-Id: <20180703123055.dtuzwjmidba2pnnm@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The bo array has req->nr_buffers elements so the > should be >= so we
don't read beyond the end of the array.

Fixes: a1606a9596e5 ("drm/nouveau: new gem pushbuf interface, bump to 0.0.16")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 300daee74209..e6ccafcb9c41 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -616,7 +616,7 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
 		struct nouveau_bo *nvbo;
 		uint32_t data;
 
-		if (unlikely(r->bo_index > req->nr_buffers)) {
+		if (unlikely(r->bo_index >= req->nr_buffers)) {
 			NV_PRINTK(err, cli, "reloc bo index invalid\n");
 			ret = -EINVAL;
 			break;
@@ -626,7 +626,7 @@ nouveau_gem_pushbuf_reloc_apply(struct nouveau_cli *cli,
 		if (b->presumed.valid)
 			continue;
 
-		if (unlikely(r->reloc_bo_index > req->nr_buffers)) {
+		if (unlikely(r->reloc_bo_index >= req->nr_buffers)) {
 			NV_PRINTK(err, cli, "reloc container bo index invalid\n");
 			ret = -EINVAL;
 			break;
