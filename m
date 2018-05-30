From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 May 2018 10:17:41 +0000
Subject: [PATCH] drm/nouveau/core: ERR_PTR vs NULL bug in nvkm_engine_info()
Message-Id: <20180530101741.yht7j7zupb6btdvn@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

The nvkm_engine_ref() function returns error pointers, not NULL on
error.  I fixed that but I also had to reverse some of the checks so it
didn't become too convoluted.

Fixes: c5c9127b25b2 ("drm/nouveau/device: implement a generic method to query device-specific properties")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/engine.c b/drivers/gpu/drm/nouveau/nvkm/core/engine.c
index d0322ce85172..ee3fbee905e6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/engine.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/engine.c
@@ -86,14 +86,17 @@ static int
 nvkm_engine_info(struct nvkm_subdev *subdev, u64 mthd, u64 *data)
 {
 	struct nvkm_engine *engine = nvkm_engine(subdev);
-	if (engine->func->info) {
-		if ((engine = nvkm_engine_ref(engine))) {
-			int ret = engine->func->info(engine, mthd, data);
-			nvkm_engine_unref(&engine);
-			return ret;
-		}
-	}
-	return -ENOSYS;
+	int ret;
+
+	if (!engine->func->info)
+		return -ENOSYS;
+
+	engine = nvkm_engine_ref(engine);
+	if (IS_ERR(engine))
+		return PTR_ERR(engine);
+	ret = engine->func->info(engine, mthd, data);
+	nvkm_engine_unref(&engine);
+	return ret;
 }
 
 static int
