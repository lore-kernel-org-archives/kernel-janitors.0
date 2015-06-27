From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jun 2015 21:23:10 +0000
Subject: [PATCH 2/2] drm/msm/dsi: One function call less in dsi_init() after error detection
Message-Id: <558F143E.60300@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net> <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6> <530A086E.8010901@users.sourceforge.net> <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6> <530A72AA.3000601@users.sourceforge.net> <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6> <530B5FB6.6010207@users.sourceforge.net> <alpine.DEB.2.10.1402241710370.2074@hadrien> <530C5E18.1020800@users.sourceforge.net> <alpine.DEB.2.10.1402251014170.2080@hadrien> <530CD2C4.4050903@users.sourceforge.net> <alpine.DEB.2.10.1402251840450.7035@hadrien> <530CF8FF.8080600@users.sourceforge.net> <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6> <530DD06F.4090703@users.sourceforge.net> <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6> <5317A59D.4@users.so
 urceforge.net> <558F12BA.60709@users.sourceforge.net>
In-Reply-To: <558F12BA.60709@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Hai Li <hali@codeaurora.org>, dri-devel@lists.freedesktop.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Rob Clark <robdclark@gmail.com>, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jun 2015 22:23:28 +0200

The dsi_destroy() function was called in two cases by the dsi_init() function
during error handling even if the passed variable contained a null pointer.

* This implementation detail could be improved by adjustments for jump
  targets according to the Linux coding style convention.

* Drop an unnecessary initialisation for the variable "msm_dsi" then.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/msm/dsi/dsi.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index dc4f38f..971f000 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -74,19 +74,15 @@ static void dsi_destroy(struct msm_dsi *msm_dsi)
 
 static struct msm_dsi *dsi_init(struct platform_device *pdev)
 {
-	struct msm_dsi *msm_dsi = NULL;
+	struct msm_dsi *msm_dsi;
 	int ret;
 
-	if (!pdev) {
-		ret = -ENXIO;
-		goto fail;
-	}
+	if (!pdev)
+		return -ENXIO;
 
 	msm_dsi = devm_kzalloc(&pdev->dev, sizeof(*msm_dsi), GFP_KERNEL);
-	if (!msm_dsi) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	if (!msm_dsi)
+		return -ENOMEM;
 	DBG("dsi probed=%p", msm_dsi);
 
 	msm_dsi->pdev = pdev;
@@ -95,21 +91,21 @@ static struct msm_dsi *dsi_init(struct platform_device *pdev)
 	/* Init dsi host */
 	ret = msm_dsi_host_init(msm_dsi);
 	if (ret)
-		goto fail;
+		goto destroy_dsi;
 
 	/* GET dsi PHY */
 	ret = dsi_get_phy(msm_dsi);
 	if (ret)
-		goto fail;
+		goto destroy_dsi;
 
 	/* Register to dsi manager */
 	ret = msm_dsi_manager_register(msm_dsi);
 	if (ret)
-		goto fail;
+		goto destroy_dsi;
 
 	return msm_dsi;
 
-fail:
+destroy_dsi:
 	dsi_destroy(msm_dsi);
 	return ERR_PTR(ret);
 }
-- 
2.4.4

