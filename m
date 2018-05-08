From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 08 May 2018 09:28:29 +0000
Subject: [PATCH 3/3] drm/xen-front: Fix loop timeout
Message-Id: <20180508092829.GC661@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xen.org

If the loop times out then we want to exit with "to" set to zero, but in
the current code it's set to -1.

Fixes: c575b7eeb89f ("drm/xen-front: Add support for Xen PV display frontend")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 378cb7ce0db5..3345ac71b391 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -778,7 +778,7 @@ static int xen_drv_remove(struct xenbus_device *dev)
 	 */
 	while ((xenbus_read_unsigned(front_info->xb_dev->otherend, "state",
 				     XenbusStateUnknown) != XenbusStateInitWait) &&
-				     to--)
+				     --to)
 		msleep(10);
 
 	if (!to) {
