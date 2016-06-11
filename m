From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 11 Jun 2016 19:56:32 +0000
Subject: [patch] media: s5p-mfc: fix a couple double frees in probe
Message-Id: <20160611195632.GA1403@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kyungmin Park <kyungmin.park@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Kamil Debski <k.debski@samsung.com>, Jeongtae Park <jtp.park@samsung.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The extra calls to video_device_release() are a bug, we free these after
the goto.

Fixes: c974c436eaf4 ('s5p-mfc: Fix race between s5p_mfc_probe() and s5p_mfc_open()')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This code would be easier to understand if it didn't use "come from"
style label names so that "goto release_dec;" would release dec etc
instead of "goto register_dec;"

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc.c b/drivers/media/platform/s5p-mfc/s5p_mfc.c
index 6ee620e..274b4f1 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc.c
@@ -1266,7 +1266,6 @@ static int s5p_mfc_probe(struct platform_device *pdev)
 	ret = video_register_device(dev->vfd_dec, VFL_TYPE_GRABBER, 0);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
-		video_device_release(dev->vfd_dec);
 		goto err_dec_reg;
 	}
 	v4l2_info(&dev->v4l2_dev,
@@ -1275,7 +1274,6 @@ static int s5p_mfc_probe(struct platform_device *pdev)
 	ret = video_register_device(dev->vfd_enc, VFL_TYPE_GRABBER, 0);
 	if (ret) {
 		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
-		video_device_release(dev->vfd_enc);
 		goto err_enc_reg;
 	}
 	v4l2_info(&dev->v4l2_dev,
