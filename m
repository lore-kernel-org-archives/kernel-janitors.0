From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 12 Feb 2016 06:40:26 +0000
Subject: [patch 1/2] misc: mic: use after free printing error message
Message-Id: <20160212064026.GD22756@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep Dutt <sudeep.dutt@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Swap the printk and kfree() to avoid a use after free bug.

Fixes: 61e9c905df78 ('misc: mic: Enable VOP host side functionality')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/mic/vop/vop_vringh.c b/drivers/misc/mic/vop/vop_vringh.c
index c1dd000..c3613f3 100644
--- a/drivers/misc/mic/vop/vop_vringh.c
+++ b/drivers/misc/mic/vop/vop_vringh.c
@@ -290,9 +290,9 @@ static int vop_virtio_add_device(struct vop_vdev *vdev,
 
 	ret = vop_copy_dp_entry(vdev, argp, &type, &dd);
 	if (ret) {
-		kfree(vdev);
 		dev_err(vop_dev(vdev), "%s %d err %d\n",
 			__func__, __LINE__, ret);
+		kfree(vdev);
 		return ret;
 	}
 
