From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Jul 2016 07:20:02 +0000
Subject: [PATCH] drm/hdlcd: Delete an unnecessary check before drm_fbdev_cma_hotplug_event()
Message-Id: <c2b0f310-fa06-f4cc-0014-ea7f40564d26@users.sourceforge.net>
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
To: dri-devel@lists.freedesktop.org, malidp@foss.arm.com, Liviu Dudau <liviu.dudau@arm.com>, David Airlie <airlied@linux.ie>, Brian Starkey <brian.starkey@arm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Jul 2016 09:10:40 +0200

The drm_fbdev_cma_hotplug_event() function tests whether its argument
is NULL and then returns immediately.
Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/arm/hdlcd_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 28b8cd1..9b1aefe 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -102,8 +102,7 @@ static void hdlcd_fb_output_poll_changed(struct drm_device *drm)
 {
 	struct hdlcd_drm_private *hdlcd = drm->dev_private;
 
-	if (hdlcd->fbdev)
-		drm_fbdev_cma_hotplug_event(hdlcd->fbdev);
+	drm_fbdev_cma_hotplug_event(hdlcd->fbdev);
 }
 
 static const struct drm_mode_config_funcs hdlcd_mode_config_funcs = {
-- 
2.9.1

