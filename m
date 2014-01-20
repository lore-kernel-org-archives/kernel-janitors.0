From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 20 Jan 2014 10:31:16 +0000
Subject: [patch] drm: use after free in drm_pci_exit()
Message-Id: <20140120103116.GD14233@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

We can't use "dev" after we freed it on the line before.

Fixes: b3f2333de8e8 ('drm: restrict the device list for shadow attached drivers')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
index 5736aaa7e86c..f7af69bcf3f4 100644
--- a/drivers/gpu/drm/drm_pci.c
+++ b/drivers/gpu/drm/drm_pci.c
@@ -468,8 +468,8 @@ void drm_pci_exit(struct drm_driver *driver, struct pci_driver *pdriver)
 	} else {
 		list_for_each_entry_safe(dev, tmp, &driver->legacy_dev_list,
 					 legacy_dev_list) {
-			drm_put_dev(dev);
 			list_del(&dev->legacy_dev_list);
+			drm_put_dev(dev);
 		}
 	}
 	DRM_INFO("Module unloaded\n");
