From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Nov 2020 08:11:13 +0000
Subject: [PATCH v2] drm/kmb: Fix possible oops in probe error handling
Message-Id: <20201120081113.GL18329@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20201117072103.GA1111239@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: David Airlie <airlied@linux.ie>, Edmund Dea <edmund.j.dea@intel.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>

If kmb_dsi_init() fails the "kmb->kmb_dsi" variable is an error pointer.
The kernel will Oops when we pass it to kmb_dsi_host_unregister().

Fixes: 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: write a better commit message

 drivers/gpu/drm/kmb/kmb_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index a31a840ce634..8c43b136765c 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -504,7 +504,7 @@ static int kmb_probe(struct platform_device *pdev)
 	if (IS_ERR(kmb->kmb_dsi)) {
 		drm_err(&kmb->drm, "failed to initialize DSI\n");
 		ret = PTR_ERR(kmb->kmb_dsi);
-		goto err_free1;
+		goto err_clear_drvdata;
 	}
 
 	kmb->kmb_dsi->dev = &dsi_pdev->dev;
@@ -540,8 +540,9 @@ static int kmb_probe(struct platform_device *pdev)
 	drm_crtc_cleanup(&kmb->crtc);
 	drm_mode_config_cleanup(&kmb->drm);
  err_free1:
-	dev_set_drvdata(dev, NULL);
 	kmb_dsi_host_unregister(kmb->kmb_dsi);
+ err_clear_drvdata:
+	dev_set_drvdata(dev, NULL);
 
 	return ret;
 }
-- 
2.28.0
