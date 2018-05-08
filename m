From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 08 May 2018 09:26:50 +0000
Subject: [PATCH 1/3] drm/xen-front: checking for NULL instead of IS_ERR
Message-Id: <20180508092650.GA661@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xen.org

drm_dev_alloc() returns error pointers, it never returns NULL.

Fixes: c575b7eeb89f ("drm/xen-front: Add support for Xen PV display frontend")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 1b0ea9ac330e..8615e8522c7a 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -543,8 +543,8 @@ static int xen_drm_drv_init(struct xen_drm_front_info *front_info)
 	front_info->drm_info = drm_info;
 
 	drm_dev = drm_dev_alloc(&xen_drm_driver, dev);
-	if (!drm_dev) {
-		ret = -ENOMEM;
+	if (IS_ERR(drm_dev)) {
+		ret = PTR_ERR(drm_dev);
 		goto fail;
 	}
 
