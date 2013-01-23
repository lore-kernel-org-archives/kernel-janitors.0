From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 23 Jan 2013 08:27:56 +0000
Subject: [patch v2] drm/nouveau/disp: sizeof() wrong pointer
Message-Id: <20130123082756.GA22945@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358847745.17068.7.camel@mattotaupa>
In-Reply-To: <1358847745.17068.7.camel@mattotaupa>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, Paul Menzel <paulepanter@users.sourceforge.net>

"data" is a void pointer and "args" is "data" after we have casted it to
a struct.  We care about the size of the struct here.  Btw,
sizeof(*data) is 1.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: tweaked the commit message

diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
index ca1a7d7..eb9c489 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
@@ -335,7 +335,7 @@ nv50_disp_sync_ctor(struct nouveau_object *parent,
 	struct nv50_disp_dmac *dmac;
 	int ret;
 
-	if (size < sizeof(*data) || args->head > 1)
+	if (size < sizeof(*args) || args->head > 1)
 		return -EINVAL;
 
 	ret = nv50_disp_dmac_create_(parent, engine, oclass, args->pushbuf,
@@ -374,7 +374,7 @@ nv50_disp_ovly_ctor(struct nouveau_object *parent,
 	struct nv50_disp_dmac *dmac;
 	int ret;
 
-	if (size < sizeof(*data) || args->head > 1)
+	if (size < sizeof(*args) || args->head > 1)
 		return -EINVAL;
 
 	ret = nv50_disp_dmac_create_(parent, engine, oclass, args->pushbuf,
diff --git a/drivers/gpu/drm/nouveau/core/engine/disp/nvd0.c b/drivers/gpu/drm/nouveau/core/engine/disp/nvd0.c
index 9e38ebf..f28725a 100644
--- a/drivers/gpu/drm/nouveau/core/engine/disp/nvd0.c
+++ b/drivers/gpu/drm/nouveau/core/engine/disp/nvd0.c
@@ -230,7 +230,7 @@ nvd0_disp_sync_ctor(struct nouveau_object *parent,
 	struct nv50_disp_dmac *dmac;
 	int ret;
 
-	if (size < sizeof(*data) || args->head >= priv->head.nr)
+	if (size < sizeof(*args) || args->head >= priv->head.nr)
 		return -EINVAL;
 
 	ret = nv50_disp_dmac_create_(parent, engine, oclass, args->pushbuf,
@@ -270,7 +270,7 @@ nvd0_disp_ovly_ctor(struct nouveau_object *parent,
 	struct nv50_disp_dmac *dmac;
 	int ret;
 
-	if (size < sizeof(*data) || args->head >= priv->head.nr)
+	if (size < sizeof(*args) || args->head >= priv->head.nr)
 		return -EINVAL;
 
 	ret = nv50_disp_dmac_create_(parent, engine, oclass, args->pushbuf,

