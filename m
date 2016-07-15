From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Jul 2016 19:21:36 +0000
Subject: [PATCH] drm/vc4: Delete unnecessary checks before two function calls
Message-Id: <fb33d930-6a5c-c501-6676-26bd486f1cb5@users.sourceforge.net>
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
 <5317A59D.4@users.sourceforge.net> <563CC27A.7020804@users.sourceforge.net>
In-Reply-To: <563CC27A.7020804@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Jul 2016 21:15:37 +0200

The following functions test whether their argument is NULL
and then return immediately.
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
index 54d0471..ce74d86 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -47,8 +47,7 @@ static void vc4_lastclose(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-	if (vc4->fbdev)
-		drm_fbdev_cma_restore_mode(vc4->fbdev);
+	drm_fbdev_cma_restore_mode(vc4->fbdev);
 }
 
 static const struct file_operations vc4_drm_fops = {
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 9a217fd..4ac894d 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -26,8 +26,7 @@ static void vc4_output_poll_changed(struct drm_device *dev)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 
-	if (vc4->fbdev)
-		drm_fbdev_cma_hotplug_event(vc4->fbdev);
+	drm_fbdev_cma_hotplug_event(vc4->fbdev);
 }
 
 struct vc4_commit {
-- 
2.9.1

