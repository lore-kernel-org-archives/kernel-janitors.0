From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 13 Dec 2016 12:23:32 +0000
Subject: [patch] drm: mxsfb: drm_dev_alloc() returns error pointers
Message-Id: <20161213122332.GA7519@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marek Vasut <marex@denx.de>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

We should be checking for IS_ERR() instead of NULL because
drm_dev_alloc() returns error pointers.

Fixes: 45d59d704080 ("drm: Add new driver for MXSFB controller")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 79a18bf48b54..955441f71500 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -395,8 +395,8 @@ static int mxsfb_probe(struct platform_device *pdev)
 		pdev->id_entry = of_id->data;
 
 	drm = drm_dev_alloc(&mxsfb_driver, &pdev->dev);
-	if (!drm)
-		return -ENOMEM;
+	if (IS_ERR(drm))
+		return PTR_ERR(drm);
 
 	ret = mxsfb_load(drm, 0);
 	if (ret)
