From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 22 Nov 2015 09:12:56 +0000
Subject: [PATCH] [media] soc_camera: constify v4l2_subdev_sensor_ops structures
Message-Id: <1448183576-10330-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

The v4l2_subdev_sensor_ops structures are never modified, so declare them
as const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/i2c/soc_camera/mt9m001.c |    2 +-
 drivers/media/i2c/soc_camera/mt9t031.c |    2 +-
 drivers/media/i2c/soc_camera/mt9v022.c |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/soc_camera/mt9m001.c b/drivers/media/i2c/soc_camera/mt9m001.c
index 2e14e52..69becc3 100644
--- a/drivers/media/i2c/soc_camera/mt9m001.c
+++ b/drivers/media/i2c/soc_camera/mt9m001.c
@@ -632,7 +632,7 @@ static struct v4l2_subdev_video_ops mt9m001_subdev_video_ops = {
 	.s_mbus_config	= mt9m001_s_mbus_config,
 };
 
-static struct v4l2_subdev_sensor_ops mt9m001_subdev_sensor_ops = {
+static const struct v4l2_subdev_sensor_ops mt9m001_subdev_sensor_ops = {
 	.g_skip_top_lines	= mt9m001_g_skip_top_lines,
 };
 
diff --git a/drivers/media/i2c/soc_camera/mt9t031.c b/drivers/media/i2c/soc_camera/mt9t031.c
index 3b6eeed..5c8e3ff 100644
--- a/drivers/media/i2c/soc_camera/mt9t031.c
+++ b/drivers/media/i2c/soc_camera/mt9t031.c
@@ -728,7 +728,7 @@ static struct v4l2_subdev_video_ops mt9t031_subdev_video_ops = {
 	.s_mbus_config	= mt9t031_s_mbus_config,
 };
 
-static struct v4l2_subdev_sensor_ops mt9t031_subdev_sensor_ops = {
+static const struct v4l2_subdev_sensor_ops mt9t031_subdev_sensor_ops = {
 	.g_skip_top_lines	= mt9t031_g_skip_top_lines,
 };
 
diff --git a/drivers/media/i2c/soc_camera/mt9v022.c b/drivers/media/i2c/soc_camera/mt9v022.c
index c2ba1fb..2721e58 100644
--- a/drivers/media/i2c/soc_camera/mt9v022.c
+++ b/drivers/media/i2c/soc_camera/mt9v022.c
@@ -860,7 +860,7 @@ static struct v4l2_subdev_video_ops mt9v022_subdev_video_ops = {
 	.s_mbus_config	= mt9v022_s_mbus_config,
 };
 
-static struct v4l2_subdev_sensor_ops mt9v022_subdev_sensor_ops = {
+static const struct v4l2_subdev_sensor_ops mt9v022_subdev_sensor_ops = {
 	.g_skip_top_lines	= mt9v022_g_skip_top_lines,
 };
 

