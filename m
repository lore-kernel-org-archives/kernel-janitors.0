From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 21 Apr 2013 11:07:53 +0000
Subject: [patch] staging/ozwpan: info leak in oz_cdev_ioctl()
Message-Id: <20130421110753.GB6171@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

If we're not maxed out then oz_get_pd_list() leaves part of the "list"
struct uninitialized.  We should clear this so that no stack information
is leaked to userspace.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/ozwpan/ozcdev.c b/drivers/staging/ozwpan/ozcdev.c
index ba15aeb..27d0666 100644
--- a/drivers/staging/ozwpan/ozcdev.c
+++ b/drivers/staging/ozwpan/ozcdev.c
@@ -253,6 +253,7 @@ static long oz_cdev_ioctl(struct file *filp, unsigned int cmd,
 	case OZ_IOCTL_GET_PD_LIST: {
 			struct oz_pd_list list;
 			oz_trace("OZ_IOCTL_GET_PD_LIST\n");
+			memset(&list, 0, sizeof(list));
 			list.count = oz_get_pd_list(list.addr, OZ_MAX_PDS);
 			if (copy_to_user((void __user *)arg, &list,
 				sizeof(list)))
