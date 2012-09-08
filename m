From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 08 Sep 2012 09:57:35 +0000
Subject: [patch 2/3] xen/privcmd: return -EFAULT on error
Message-Id: <20120908095735.GB608@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andres Lagar-Cavilla <andreslc@gridcentric.ca>
Cc: kernel-janitors@vger.kernel.org, Jeremy Fitzhardinge <jeremy@goop.org>, xen-devel@lists.xensource.com, virtualization@lists.linux-foundation.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

__copy_to_user() returns the number of bytes remaining to be copied but
we want to return a negative error code here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/xen/privcmd.c b/drivers/xen/privcmd.c
index fdff8f9..0ce006a 100644
--- a/drivers/xen/privcmd.c
+++ b/drivers/xen/privcmd.c
@@ -393,8 +393,11 @@ static long privcmd_ioctl_mmap_batch(void __user *udata, int version)
 		state.err      = err_array;
 		ret = traverse_pages(m.num, sizeof(xen_pfn_t),
 				     &pagelist, mmap_return_errors_v1, &state);
-	} else if (version = 2)
+	} else if (version = 2) {
 		ret = __copy_to_user(m.err, err_array, m.num * sizeof(int));
+		if (ret)
+			ret = -EFAULT;
+	}
 
 	/* If we have not had any EFAULT-like global errors then set the global
 	 * error to -ENOENT if necessary. */
