From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Jul 2016 20:00:06 +0000
Subject: [PATCH] drm/arcpgu: Delete an unnecessary check before drm_fbdev_cma_hotplug_event()
Message-Id: <dd9a16b1-234c-6776-e6d9-943a8457334e@users.sourceforge.net>
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
To: Alexey Brodkin <abrodkin@synopsys.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 15 Jul 2016 21:52:40 +0200

The drm_fbdev_cma_hotplug_event() function tests whether its argument
is NULL and then returns immediately.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/arc/arcpgu_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arc/arcpgu_drv.c b/drivers/gpu/drm/arc/arcpgu_drv.c
index ccbdadb..740d8ba 100644
--- a/drivers/gpu/drm/arc/arcpgu_drv.c
+++ b/drivers/gpu/drm/arc/arcpgu_drv.c
@@ -28,8 +28,7 @@ static void arcpgu_fb_output_poll_changed(struct drm_device *dev)
 {
 	struct arcpgu_drm_private *arcpgu = dev->dev_private;
 
-	if (arcpgu->fbdev)
-		drm_fbdev_cma_hotplug_event(arcpgu->fbdev);
+	drm_fbdev_cma_hotplug_event(arcpgu->fbdev);
 }
 
 static struct drm_mode_config_funcs arcpgu_drm_modecfg_funcs = {
-- 
2.9.1

