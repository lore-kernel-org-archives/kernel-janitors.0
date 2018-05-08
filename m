From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 08 May 2018 09:27:39 +0000
Subject: [PATCH 2/3] drm/xen-front: fix xen_drm_front_shbuf_alloc() error handling
Message-Id: <20180508092739.GB661@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xen.org

The xen_drm_front_shbuf_alloc() function was returning a mix of error
pointers and NULL and the the caller wasn't checking correctly.  I've
changed it to always return error pointer consistently.

Fixes: c575b7eeb89f ("drm/xen-front: Add support for Xen PV display frontend")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/xen/xen_drm_front_shbuf.c b/drivers/gpu/drm/xen/xen_drm_front_shbuf.c
index d5705251a0d6..8099cb343ae3 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_shbuf.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_shbuf.c
@@ -383,7 +383,7 @@ xen_drm_front_shbuf_alloc(struct xen_drm_front_shbuf_cfg *cfg)
 
 	buf = kzalloc(sizeof(*buf), GFP_KERNEL);
 	if (!buf)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	if (cfg->be_alloc)
 		buf->ops = &backend_ops;
diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 8615e8522c7a..378cb7ce0db5 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -188,8 +188,8 @@ int xen_drm_front_dbuf_create(struct xen_drm_front_info *front_info,
 	buf_cfg.be_alloc = front_info->cfg.be_alloc;
 
 	shbuf = xen_drm_front_shbuf_alloc(&buf_cfg);
-	if (!shbuf)
-		return -ENOMEM;
+	if (IS_ERR(shbuf))
+		return PTR_ERR(shbuf);
 
 	ret = dbuf_add_to_list(front_info, shbuf, dbuf_cookie);
 	if (ret < 0) {
