From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 19 Aug 2016 18:28:58 +0000
Subject: [PATCH 1/2] misc/mic/vop: Use memdup_user() rather than duplicating its implementation
Message-Id: <ee628d2d-6c0b-1566-2757-33ee0983e6fd@users.sourceforge.net>
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
Date: Fri, 19 Aug 2016 19:48:45 +0200

Reuse existing functionality from memdup_user() instead of keeping
duplicate source code.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/mic/vop/vop_vringh.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/misc/mic/vop/vop_vringh.c b/drivers/misc/mic/vop/vop_vringh.c
index 88e4523..84c95fe 100644
--- a/drivers/misc/mic/vop/vop_vringh.c
+++ b/drivers/misc/mic/vop/vop_vringh.c
@@ -938,13 +938,9 @@ static long vop_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 		    dd.num_vq > MIC_MAX_VRINGS)
 			return -EINVAL;
 
-		dd_config = kzalloc(mic_desc_size(&dd), GFP_KERNEL);
-		if (!dd_config)
-			return -ENOMEM;
-		if (copy_from_user(dd_config, argp, mic_desc_size(&dd))) {
-			ret = -EFAULT;
-			goto free_ret;
-		}
+		dd_config = memdup_user(argp, mic_desc_size(&dd));
+		if (IS_ERR(dd_config))
+			return PTR_ERR(dd_config);
 		/* Ensure desc has not changed between the two reads */
 		if (memcmp(&dd, dd_config, sizeof(dd))) {
 			ret = -EINVAL;
@@ -996,17 +992,12 @@ _unlock_ret:
 		ret = vop_vdev_inited(vdev);
 		if (ret)
 			goto __unlock_ret;
-		buf = kzalloc(vdev->dd->config_len, GFP_KERNEL);
-		if (!buf) {
-			ret = -ENOMEM;
+		buf = memdup_user(argp, vdev->dd->config_len);
+		if (IS_ERR(buf)) {
+			ret = PTR_ERR(buf);
 			goto __unlock_ret;
 		}
-		if (copy_from_user(buf, argp, vdev->dd->config_len)) {
-			ret = -EFAULT;
-			goto done;
-		}
 		ret = vop_virtio_config_change(vdev, buf);
-done:
 		kfree(buf);
 __unlock_ret:
 		mutex_unlock(&vdev->vdev_mutex);
-- 
2.9.3

