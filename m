From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 06 Nov 2015 15:08:42 +0000
Subject: [PATCH] GPU-DRM-vc4: Delete unnecessary checks before two function calls
Message-Id: <563CC27A.7020804@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 6 Nov 2015 16:04:22 +0100

The following functions test whether their argument is NULL and then
return immediately.
* drm_fbdev_cma_hotplug_event
* drm_fbdev_cma_restore_mode

Thus the tests around their calls are not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 3 +--
 drivers/gpu/drm/vc4/vc4_kms.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 6e73060..df348c0 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -54,8 +54,7 @@ static void vc4_lastclose(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-	if (vc4->fbdev)
-		drm_fbdev_cma_restore_mode(vc4->fbdev);
+	drm_fbdev_cma_restore_mode(vc4->fbdev);
 }
 
 static const struct file_operations vc4_drm_fops = {
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 2e5597d..1778203 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -25,8 +25,7 @@ static void vc4_output_poll_changed(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-	if (vc4->fbdev)
-		drm_fbdev_cma_hotplug_event(vc4->fbdev);
+	drm_fbdev_cma_hotplug_event(vc4->fbdev);
 }
 
 static const struct drm_mode_config_funcs vc4_mode_funcs = {
-- 
2.6.2

