From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Nov 2014 15:16:11 +0000
Subject: [PATCH 1/1] IMX-DRM-core: Deletion of a check before drm_fbdev_cma_restore_mode()
Message-Id: <54749D3B.5000008@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.sourceforge.net>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 25 Nov 2014 16:06:19 +0100

The drm_fbdev_cma_restore_mode() function tests whether its argument is NULL
and then returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/imx-drm/imx-drm-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/imx-drm/imx-drm-core.c b/drivers/staging/imx-drm/imx-drm-core.c
index 6b22106..0a1ecef 100644
--- a/drivers/staging/imx-drm/imx-drm-core.c
+++ b/drivers/staging/imx-drm/imx-drm-core.c
@@ -64,8 +64,7 @@ static void imx_drm_driver_lastclose(struct drm_device *drm)
 #if IS_ENABLED(CONFIG_DRM_IMX_FB_HELPER)
 	struct imx_drm_device *imxdrm = drm->dev_private;
 
-	if (imxdrm->fbhelper)
-		drm_fbdev_cma_restore_mode(imxdrm->fbhelper);
+	drm_fbdev_cma_restore_mode(imxdrm->fbhelper);
 #endif
 }
 
-- 
2.1.3

