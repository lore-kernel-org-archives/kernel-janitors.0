From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Nov 2020 07:21:37 +0000
Subject: [PATCH] drm/kmb: Remove an unnecessary NULL check
Message-Id: <20201117072137.GB1111239@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, Edmund Dea <edmund.j.dea@intel.com>, dri-devel@lists.freedesktop.org

The NULL checking isn't done consistently in this function and it leads
to a static checker warning:

    drivers/gpu/drm/kmb/kmb_drv.c:561 kmb_pm_suspend()
    error: we previously assumed 'drm' could be null (see line 559)

Fortunately "drm" cannot be NULL at this point so the check can just be
removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 8c43b136765c..5ff392644603 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -557,7 +557,7 @@ MODULE_DEVICE_TABLE(of, kmb_of_match);
 static int __maybe_unused kmb_pm_suspend(struct device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(dev);
-	struct kmb_drm_private *kmb = drm ? to_kmb(drm) : NULL;
+	struct kmb_drm_private *kmb = to_kmb(drm);
 
 	drm_kms_helper_poll_disable(drm);
 
-- 
2.28.0
