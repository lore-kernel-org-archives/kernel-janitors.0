From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 28 Jun 2012 06:45:26 +0000
Subject: [patch 3/3] vfio: return -EFAULT on failure
Message-Id: <20120628064524.GC11107@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1340686552.1207.128.camel@bling.home>
In-Reply-To: <1340686552.1207.128.camel@bling.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This ioctl function is supposed to return a negative error code or zero
on success.  copy_to_user() returns zero or the number of bytes
remaining to be copied.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
index 457acf3..1aa373f 100644
--- a/drivers/vfio/vfio.c
+++ b/drivers/vfio/vfio.c
@@ -1159,6 +1159,8 @@ static long vfio_group_fops_unl_ioctl(struct file *filep,
 			status.flags |= VFIO_GROUP_FLAGS_CONTAINER_SET;
 
 		ret = copy_to_user((void __user *)arg, &status, minsz);
+		if (ret)
+			ret = -EFAULT;
 
 		break;
 	}
