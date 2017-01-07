From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 07 Jan 2017 06:30:08 +0000
Subject: [patch 3/3] vfio-mdev: remove some dead code
Message-Id: <20170107063008.GC26959@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kirti Wankhede <kwankhede@nvidia.com>
Cc: kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

We set info.count to 1 in mtty_get_irq_info() so static checkers
complain that, "Why do we have impossible conditions?"  The answer is
that it seems to be left over dead code that can be safely removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index 353666d68207..d6ddc31fa729 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -1230,9 +1230,6 @@ static long mtty_ioctl(struct mdev_device *mdev, unsigned int cmd,
 		if (ret)
 			return ret;
 
-		if (info.count = -1)
-			return -EINVAL;
-
 		if (copy_to_user((void __user *)arg, &info, minsz))
 			return -EFAULT;
 
