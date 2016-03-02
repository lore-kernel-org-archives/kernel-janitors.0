From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 02 Mar 2016 10:10:27 +0000
Subject: [patch 2/2] iommu/mediatek: checking for IS_ERR() instead of NULL
Message-Id: <20160302101027.GG5533@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, Yong Wu <yong.wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

of_platform_device_create() returns NULL on error, it never returns
error pointers.

Fixes: 0df4fabe208d ('iommu/mediatek: Add mt8173 IOMMU driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 1a4022c..4682da4 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -628,7 +628,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 			plarbdev = of_platform_device_create(
 						larbnode, NULL,
 						platform_bus_type.dev_root);
-			if (IS_ERR(plarbdev))
+			if (!plarbdev)
 				return -EPROBE_DEFER;
 		}
 		data->smi_imu.larb_imu[i].dev = &plarbdev->dev;
@@ -721,8 +721,8 @@ static int mtk_iommu_init_fn(struct device_node *np)
 	struct platform_device *pdev;
 
 	pdev = of_platform_device_create(np, NULL, platform_bus_type.dev_root);
-	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
+	if (!pdev)
+		return -ENOMEM;
 
 	ret = platform_driver_register(&mtk_iommu_driver);
 	if (ret) {
