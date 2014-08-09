From: Suman Kumar <suman@inforcecomputing.com>
Date: Sat, 09 Aug 2014 17:34:32 +0000
Subject: [PATCH] staging: soc_camera: soc_camera_platform.c: Fixed a Missing blank line coding style issue
Message-Id: <1407604952-15492-1-git-send-email-suman@inforcecomputing.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: g.liakhovetski@gmx.de
Cc: m.chehab@samsung.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, suman@inforcecomputing.com, kernel-janitors@vger.kernel.org

    Fixes a coding style issue reported by checkpatch.pl

Signed-off-by: Suman Kumar <suman@inforcecomputing.com>
---
 drivers/media/platform/soc_camera/soc_camera_platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/soc_camera/soc_camera_platform.c b/drivers/media/platform/soc_camera/soc_camera_platform.c
index ceaddfb..fe15a80 100644
--- a/drivers/media/platform/soc_camera/soc_camera_platform.c
+++ b/drivers/media/platform/soc_camera/soc_camera_platform.c
@@ -27,12 +27,14 @@ struct soc_camera_platform_priv {
 static struct soc_camera_platform_priv *get_priv(struct platform_device *pdev)
 {
 	struct v4l2_subdev *subdev = platform_get_drvdata(pdev);
+
 	return container_of(subdev, struct soc_camera_platform_priv, subdev);
 }
 
 static int soc_camera_platform_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct soc_camera_platform_info *p = v4l2_get_subdevdata(sd);
+
 	return p->set_capture(p, enable);
 }
 
-- 
1.8.2

