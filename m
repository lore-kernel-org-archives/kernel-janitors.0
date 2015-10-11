From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 11 Oct 2015 12:18:09 +0000
Subject: [PATCH] drm/nouveau/disp,pm: constify nvkm_object_func structures
Message-Id: <1444565889-27074-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

These nvkm_object_func structures are never modified.  All other
nvkm_object_func structures are declared as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv04.c |    2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv04.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv04.c
index 62d3fb6..2be8463 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv04.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/rootnv04.c
@@ -109,7 +109,7 @@ nv04_disp_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
 	return -EINVAL;
 }
 
-static struct nvkm_object_func
+static const struct nvkm_object_func
 nv04_disp_root = {
 	.mthd = nv04_disp_mthd,
 	.ntfy = nvkm_disp_ntfy,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c
index 0db9be2..2721592 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c
@@ -633,7 +633,7 @@ nvkm_perfmon_dtor(struct nvkm_object *object)
 	return perfmon;
 }
 
-static struct nvkm_object_func
+static const struct nvkm_object_func
 nvkm_perfmon = {
 	.dtor = nvkm_perfmon_dtor,
 	.mthd = nvkm_perfmon_mthd,

