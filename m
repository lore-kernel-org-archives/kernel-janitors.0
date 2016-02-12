From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 12 Feb 2016 06:44:34 +0000
Subject: [patch 2/2] misc: mic: silence an overflow warning
Message-Id: <20160212064434.GE22756@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sudeep Dutt <sudeep.dutt@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Static checkers complain that the this is a potential array overflow.
We verify that it's not on the next line so this code is OK, but
static checker warnings are annoying.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
We would have caught CVE-2015-5327 if we had ordered it to check first
before using the offset.

diff --git a/drivers/misc/mic/vop/vop_vringh.c b/drivers/misc/mic/vop/vop_vringh.c
index c3613f3..e94c7fb 100644
--- a/drivers/misc/mic/vop/vop_vringh.c
+++ b/drivers/misc/mic/vop/vop_vringh.c
@@ -848,12 +848,13 @@ static int vop_virtio_copy_desc(struct vop_vdev *vdev,
 				struct mic_copy_desc *copy)
 {
 	int err;
-	struct vop_vringh *vvr = &vdev->vvr[copy->vr_idx];
+	struct vop_vringh *vvr;
 
 	err = vop_verify_copy_args(vdev, copy);
 	if (err)
 		return err;
 
+	vvr = &vdev->vvr[copy->vr_idx];
 	mutex_lock(&vvr->vr_mutex);
 	if (!vop_vdevup(vdev)) {
 		err = -ENODEV;
