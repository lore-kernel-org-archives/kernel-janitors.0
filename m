From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 08 Jan 2015 10:07:08 +0000
Subject: [patch] [media] coda: improve safety in coda_register_device()
Message-Id: <20150108100708.GA10597@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The "i" variable is used as an offset into both the dev->vfd[] and the
dev->devtype->vdevs[] arrays.  The second array is smaller so we should
use that as a limit instead of ARRAY_SIZE(dev->vfd).  Also the original
check was off by one.

We should use a format string as well in case the ->name has any funny
characters and also to stop static checkers from complaining.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 39330a7..5dd6cae 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -1844,10 +1844,11 @@ static int coda_register_device(struct coda_dev *dev, int i)
 {
 	struct video_device *vfd = &dev->vfd[i];
 
-	if (i > ARRAY_SIZE(dev->vfd))
+	if (i >= dev->devtype->num_vdevs)
 		return -EINVAL;
 
-	snprintf(vfd->name, sizeof(vfd->name), dev->devtype->vdevs[i]->name);
+	snprintf(vfd->name, sizeof(vfd->name), "%s",
+		 dev->devtype->vdevs[i]->name);
 	vfd->fops	= &coda_fops;
 	vfd->ioctl_ops	= &coda_ioctl_ops;
 	vfd->release	= video_device_release_empty,
