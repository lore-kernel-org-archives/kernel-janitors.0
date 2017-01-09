From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 09 Jan 2017 08:20:16 +0000
Subject: [patch] misc: mic: double free on ioctl error path
Message-Id: <20170109081919.GA23562@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep Dutt <sudeep.dutt@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This function only has one caller.  Freeing "vdev" here leads to a use
after free bug.  There are several other error paths in this function
but this is the only one which frees "vdev".  It looks like the kfree()
can be safely removed.

Fixes: 61e9c905df78 ("misc: mic: Enable VOP host side functionality")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/mic/vop/vop_vringh.c b/drivers/misc/mic/vop/vop_vringh.c
index 88e45234d527..fed992e2c258 100644
--- a/drivers/misc/mic/vop/vop_vringh.c
+++ b/drivers/misc/mic/vop/vop_vringh.c
@@ -292,7 +292,6 @@ static int vop_virtio_add_device(struct vop_vdev *vdev,
 	if (ret) {
 		dev_err(vop_dev(vdev), "%s %d err %d\n",
 			__func__, __LINE__, ret);
-		kfree(vdev);
 		return ret;
 	}
 
