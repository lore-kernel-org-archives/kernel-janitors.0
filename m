From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 25 Jun 2020 20:19:47 +0000
Subject: [PATCH] media: s5p-g2d: Fix a memory leak in an error handling path in 'g2d_probe()'
Message-Id: <20200625201947.943043-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200426200631.42497-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200426200631.42497-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hverkuil@xs4all.nl, kyungmin.park@samsung.com, kamil@wypas.org, a.hajda@samsung.com, mchehab@kernel.org
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org

Memory allocated with 'v4l2_m2m_init()' must be freed by a corresponding
call to 'v4l2_m2m_release()'

Also reorder the code at the end of the probe function so that
'video_register_device()' is called last.
Update the error handling path accordingly.

Fixes: 5ce60d790a24 ("[media] s5p-g2d: Add DT based discovery support")
Fixes: 918847341af0 ("[media] v4l: add G2D driver for s5p device family")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
V2: Call 'video_register_device()' as required by Hans Verkuil <hverkuil@xs4all.nl>

Compile tested only.
---
 drivers/media/platform/s5p-g2d/g2d.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/s5p-g2d/g2d.c b/drivers/media/platform/s5p-g2d/g2d.c
index 6932fd47071b..fb2e48dbabd4 100644
--- a/drivers/media/platform/s5p-g2d/g2d.c
+++ b/drivers/media/platform/s5p-g2d/g2d.c
@@ -695,21 +695,13 @@ static int g2d_probe(struct platform_device *pdev)
 	vfd->lock = &dev->mutex;
 	vfd->v4l2_dev = &dev->v4l2_dev;
 	vfd->device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING;
-	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
-	if (ret) {
-		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
-		goto rel_vdev;
-	}
-	video_set_drvdata(vfd, dev);
-	dev->vfd = vfd;
-	v4l2_info(&dev->v4l2_dev, "device registered as /dev/video%d\n",
-								vfd->num);
+
 	platform_set_drvdata(pdev, dev);
 	dev->m2m_dev = v4l2_m2m_init(&g2d_m2m_ops);
 	if (IS_ERR(dev->m2m_dev)) {
 		v4l2_err(&dev->v4l2_dev, "Failed to init mem2mem device\n");
 		ret = PTR_ERR(dev->m2m_dev);
-		goto unreg_video_dev;
+		goto rel_vdev;
 	}
 
 	def_frame.stride = (def_frame.width * def_frame.fmt->depth) >> 3;
@@ -717,14 +709,24 @@ static int g2d_probe(struct platform_device *pdev)
 	of_id = of_match_node(exynos_g2d_match, pdev->dev.of_node);
 	if (!of_id) {
 		ret = -ENODEV;
-		goto unreg_video_dev;
+		goto free_m2m;
 	}
 	dev->variant = (struct g2d_variant *)of_id->data;
 
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, 0);
+	if (ret) {
+		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
+		goto free_m2m;
+	}
+	video_set_drvdata(vfd, dev);
+	dev->vfd = vfd;
+	v4l2_info(&dev->v4l2_dev, "device registered as /dev/video%d\n",
+								vfd->num);
+
 	return 0;
 
-unreg_video_dev:
-	video_unregister_device(dev->vfd);
+free_m2m:
+	v4l2_m2m_release(dev->m2m_dev);
 rel_vdev:
 	video_device_release(vfd);
 unreg_v4l2_dev:
-- 
2.25.1
