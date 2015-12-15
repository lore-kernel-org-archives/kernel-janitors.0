From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Dec 2015 11:00:40 +0000
Subject: [patch] [media] media-device: copy_to/from_user() returns positive
Message-Id: <20151215110040.GA9594@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The copy_to/from_user() functions return the number of bytes *not*
copied.  They don't return error codes.

Fixes: 4f6b3f363475 ('media] media-device: add support for MEDIA_IOC_G_TOPOLOGY ioctl')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/media/media-device.c b/drivers/media/media-device.c
index c12481c..96ed207 100644
--- a/drivers/media/media-device.c
+++ b/drivers/media/media-device.c
@@ -376,18 +376,17 @@ static long media_device_get_topology(struct media_device *mdev,
 	struct media_v2_topology ktopo;
 	int ret;
 
-	ret = copy_from_user(&ktopo, utopo, sizeof(ktopo));
-
-	if (ret < 0)
-		return ret;
+	if (copy_from_user(&ktopo, utopo, sizeof(ktopo)))
+		return -EFAULT;
 
 	ret = __media_device_get_topology(mdev, &ktopo);
 	if (ret < 0)
 		return ret;
 
-	ret = copy_to_user(utopo, &ktopo, sizeof(*utopo));
+	if (copy_to_user(utopo, &ktopo, sizeof(*utopo)))
+		return -EFAULT;
 
-	return ret;
+	return 0;
 }
 
 static long media_device_ioctl(struct file *filp, unsigned int cmd,
