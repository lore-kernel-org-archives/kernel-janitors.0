From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 08 Sep 2012 09:52:08 +0000
Subject: [patch 1/3] xen/privcmd: check for integer overflow in ioctl
Message-Id: <20120908095208.GA608@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andres Lagar-Cavilla <andreslc@gridcentric.ca>
Cc: kernel-janitors@vger.kernel.org, Jeremy Fitzhardinge <jeremy@goop.org>, xen-devel@lists.xensource.com, virtualization@lists.linux-foundation.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

If m.num is too large then the "m.num * sizeof(*m.arr)" multiplication
could overflow and the access_ok() check wouldn't test the right size.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Only needed in linux-next.

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index 215a3c0..fdff8f9 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -325,6 +325,8 @@ static long privcmd_ioctl_mmap_batch(void __user *udata, int version)
 			return -EFAULT;
 		/* Returns per-frame error in m.arr. */
 		m.err = NULL;
+		if (m.num > SIZE_MAX / sizeof(*m.arr))
+			return -EINVAL;
 		if (!access_ok(VERIFY_WRITE, m.arr, m.num * sizeof(*m.arr)))
 			return -EFAULT;
 		break;
@@ -332,6 +334,8 @@ static long privcmd_ioctl_mmap_batch(void __user *udata, int version)
 		if (copy_from_user(&m, udata, sizeof(struct privcmd_mmapbatch_v2)))
 			return -EFAULT;
 		/* Returns per-frame error code in m.err. */
+		if (m.num > SIZE_MAX / sizeof(*m.err))
+			return -EINVAL;
 		if (!access_ok(VERIFY_WRITE, m.err, m.num * (sizeof(*m.err))))
 			return -EFAULT;
 		break;
