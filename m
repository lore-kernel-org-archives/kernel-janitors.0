From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Jul 2016 11:41:39 +0000
Subject: [patch 1/2] drivers/virt: fix the error handling in ioctl_dtprop()
Message-Id: <20160714114139.GK18175@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Hansen <dave.hansen@linux.intel.com>, Timur Tabi <timur@freescale.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If strndup_user() user fails then it returns an error pointer and we
pass that to kfree() which causes an oops.

I've shifted this code around so that we keep only free things which
have been allocated.  We don't need to initialize the pointers at the
start any more.  We can also move the check for invalid proplen earlier
so it's before the allocations.

Fixes: 6db7199407ca ('drivers/virt: introduce Freescale hypervisor management driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I have to be honest here.  I haven't "properly" compiled this.  I hacked
up Smatch to do a best effort compile of code even if there were include
files missing etc.

diff --git a/drivers/virt/fsl_hypervisor.c b/drivers/virt/fsl_hypervisor.c
index 60bdad3..146f531 100644
--- a/drivers/virt/fsl_hypervisor.c
+++ b/drivers/virt/fsl_hypervisor.c
@@ -334,45 +334,41 @@ static long ioctl_dtprop(struct fsl_hv_ioctl_prop __user *p, int set)
 	struct fsl_hv_ioctl_prop param;
 	char __user *upath, *upropname;
 	void __user *upropval;
-	char *path = NULL, *propname = NULL;
-	void *propval = NULL;
+	char *path, *propname;
+	void *propval;
 	int ret = 0;
 
 	/* Get the parameters from the user. */
 	if (copy_from_user(&param, p, sizeof(struct fsl_hv_ioctl_prop)))
 		return -EFAULT;
 
+	if (param.proplen > FH_DTPROP_MAX_PROPLEN)
+		return -EINVAL;
+
 	upath = (char __user *)(uintptr_t)param.path;
 	upropname = (char __user *)(uintptr_t)param.propname;
 	upropval = (void __user *)(uintptr_t)param.propval;
 
 	path = strndup_user(upath, FH_DTPROP_MAX_PATHLEN);
-	if (IS_ERR(path)) {
-		ret = PTR_ERR(path);
-		goto out;
-	}
+	if (IS_ERR(path))
+		return PTR_ERR(path);
 
 	propname = strndup_user(upropname, FH_DTPROP_MAX_PATHLEN);
 	if (IS_ERR(propname)) {
 		ret = PTR_ERR(propname);
-		goto out;
-	}
-
-	if (param.proplen > FH_DTPROP_MAX_PROPLEN) {
-		ret = -EINVAL;
-		goto out;
+		goto free_path;
 	}
 
 	propval = kmalloc(param.proplen, GFP_KERNEL);
 	if (!propval) {
 		ret = -ENOMEM;
-		goto out;
+		goto free_propname;
 	}
 
 	if (set) {
 		if (copy_from_user(propval, upropval, param.proplen)) {
 			ret = -EFAULT;
-			goto out;
+			goto free_propval;
 		}
 
 		param.ret = fh_partition_set_dtprop(param.handle,
@@ -391,7 +387,7 @@ static long ioctl_dtprop(struct fsl_hv_ioctl_prop __user *p, int set)
 			if (copy_to_user(upropval, propval, param.proplen) ||
 			    put_user(param.proplen, &p->proplen)) {
 				ret = -EFAULT;
-				goto out;
+				goto free_propval;
 			}
 		}
 	}
@@ -399,10 +395,12 @@ static long ioctl_dtprop(struct fsl_hv_ioctl_prop __user *p, int set)
 	if (put_user(param.ret, &p->ret))
 		ret = -EFAULT;
 
-out:
-	kfree(path);
+free_propval:
 	kfree(propval);
+free_propname:
 	kfree(propname);
+free_path:
+	kfree(path);
 
 	return ret;
 }
