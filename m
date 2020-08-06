From: Colin King <colin.king@canonical.com>
Date: Thu, 06 Aug 2020 11:57:17 +0000
Subject: [PATCH] media: atomisp: fix spelling mistake "unsupport" -> "unsupported"
Message-Id: <20200806115717.59613-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are spelling mistakes in some dev_err messages. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index f8d616f08b51..25312903f27e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -2588,7 +2588,7 @@ static int atomisp_g_parm(struct file *file, void *fh,
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 
 	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) {
-		dev_err(isp->dev, "unsupport v4l2 buf type\n");
+		dev_err(isp->dev, "unsupported v4l2 buf type\n");
 		return -EINVAL;
 	}
 
@@ -2610,7 +2610,7 @@ static int atomisp_s_parm(struct file *file, void *fh,
 	int fps;
 
 	if (parm->type != V4L2_BUF_TYPE_VIDEO_CAPTURE) {
-		dev_err(isp->dev, "unsupport v4l2 buf type\n");
+		dev_err(isp->dev, "unsupported v4l2 buf type\n");
 		return -EINVAL;
 	}
 
@@ -2668,7 +2668,7 @@ static int atomisp_s_parm_file(struct file *file, void *fh,
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 
 	if (parm->type != V4L2_BUF_TYPE_VIDEO_OUTPUT) {
-		dev_err(isp->dev, "unsupport v4l2 buf type for output\n");
+		dev_err(isp->dev, "unsupported v4l2 buf type for output\n");
 		return -EINVAL;
 	}
 
-- 
2.27.0
