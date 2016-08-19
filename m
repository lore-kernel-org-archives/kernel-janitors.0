From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 Aug 2016 18:30:08 +0000
Subject: [PATCH 2/2] misc/mic/vop: Rename jump labels in vop_ioctl()
Message-Id: <2b6ace93-f2a9-1224-f6d1-d1054b08240f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <f0ce0834-43e4-0535-9ae0-b18d3d18b0e0@users.sourceforge.net>
In-Reply-To: <f0ce0834-43e4-0535-9ae0-b18d3d18b0e0@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, Sudeep Dutt <sudeep.dutt@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 Aug 2016 20:02:50 +0200

Adjust jump targets according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/mic/vop/vop_vringh.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/misc/mic/vop/vop_vringh.c b/drivers/misc/mic/vop/vop_vringh.c
index 84c95fe..201a662 100644
--- a/drivers/misc/mic/vop/vop_vringh.c
+++ b/drivers/misc/mic/vop/vop_vringh.c
@@ -944,18 +944,18 @@ static long vop_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 		/* Ensure desc has not changed between the two reads */
 		if (memcmp(&dd, dd_config, sizeof(dd))) {
 			ret = -EINVAL;
-			goto free_ret;
+			goto free_config;
 		}
 		mutex_lock(&vdev->vdev_mutex);
 		mutex_lock(&vi->vop_mutex);
 		ret = vop_virtio_add_device(vdev, dd_config);
 		if (ret)
-			goto unlock_ret;
+			goto unlock_device_addition;
 		list_add_tail(&vdev->list, &vi->vdev_list);
-unlock_ret:
+unlock_device_addition:
 		mutex_unlock(&vi->vop_mutex);
 		mutex_unlock(&vdev->vdev_mutex);
-free_ret:
+free_config:
 		kfree(dd_config);
 		return ret;
 	}
@@ -966,21 +966,21 @@ free_ret:
 		mutex_lock(&vdev->vdev_mutex);
 		ret = vop_vdev_inited(vdev);
 		if (ret)
-			goto _unlock_ret;
+			goto unlock_desc_copy;
 
 		if (copy_from_user(&copy, argp, sizeof(copy))) {
 			ret = -EFAULT;
-			goto _unlock_ret;
+			goto unlock_desc_copy;
 		}
 
 		ret = vop_virtio_copy_desc(vdev, &copy);
 		if (ret < 0)
-			goto _unlock_ret;
+			goto unlock_desc_copy;
 		if (copy_to_user(
 			&((struct mic_copy_desc __user *)argp)->out_len,
 			&copy.out_len, sizeof(copy.out_len)))
 			ret = -EFAULT;
-_unlock_ret:
+unlock_desc_copy:
 		mutex_unlock(&vdev->vdev_mutex);
 		return ret;
 	}
@@ -991,15 +991,15 @@ _unlock_ret:
 		mutex_lock(&vdev->vdev_mutex);
 		ret = vop_vdev_inited(vdev);
 		if (ret)
-			goto __unlock_ret;
+			goto unlock_config_change;
 		buf = memdup_user(argp, vdev->dd->config_len);
 		if (IS_ERR(buf)) {
 			ret = PTR_ERR(buf);
-			goto __unlock_ret;
+			goto unlock_config_change;
 		}
 		ret = vop_virtio_config_change(vdev, buf);
 		kfree(buf);
-__unlock_ret:
+unlock_config_change:
 		mutex_unlock(&vdev->vdev_mutex);
 		return ret;
 	}
-- 
2.9.3

