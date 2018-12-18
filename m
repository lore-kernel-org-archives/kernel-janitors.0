From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Dec 2018 08:20:03 +0000
Subject: [PATCH 1/2] fsl_hypervisor: dereferencing error pointers in ioctl
Message-Id: <20181218082003.GD32567@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Timur Tabi <timur@freescale.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Mihai Caraman <mihai.caraman@freescale.com>, Kumar Gala <galak@kernel.crashing.org>

The strndup_user() function returns error pointers on error, and then
in the error handling we pass the error pointers to kfree().  It will
cause an Oops.

Fixes: 6db7199407ca ("drivers/virt: introduce Freescale hypervisor management driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/virt/fsl_hypervisor.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/virt/fsl_hypervisor.c b/drivers/virt/fsl_hypervisor.c
index 8ba726e600e9..7b7f8e9a2801 100644
--- a/drivers/virt/fsl_hypervisor.c
+++ b/drivers/virt/fsl_hypervisor.c
@@ -331,8 +331,8 @@ static long ioctl_dtprop(struct fsl_hv_ioctl_prop __user *p, int set)
 	struct fsl_hv_ioctl_prop param;
 	char __user *upath, *upropname;
 	void __user *upropval;
-	char *path = NULL, *propname = NULL;
-	void *propval = NULL;
+	char *path, *propname;
+	void *propval;
 	int ret = 0;
 
 	/* Get the parameters from the user. */
@@ -344,32 +344,30 @@ static long ioctl_dtprop(struct fsl_hv_ioctl_prop __user *p, int set)
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
+		goto err_free_path;
 	}
 
 	if (param.proplen > FH_DTPROP_MAX_PROPLEN) {
 		ret = -EINVAL;
-		goto out;
+		goto err_free_propname;
 	}
 
 	propval = kmalloc(param.proplen, GFP_KERNEL);
 	if (!propval) {
 		ret = -ENOMEM;
-		goto out;
+		goto err_free_propname;
 	}
 
 	if (set) {
 		if (copy_from_user(propval, upropval, param.proplen)) {
 			ret = -EFAULT;
-			goto out;
+			goto err_free_propval;
 		}
 
 		param.ret = fh_partition_set_dtprop(param.handle,
@@ -388,7 +386,7 @@ static long ioctl_dtprop(struct fsl_hv_ioctl_prop __user *p, int set)
 			if (copy_to_user(upropval, propval, param.proplen) ||
 			    put_user(param.proplen, &p->proplen)) {
 				ret = -EFAULT;
-				goto out;
+				goto err_free_propval;
 			}
 		}
 	}
@@ -396,10 +394,12 @@ static long ioctl_dtprop(struct fsl_hv_ioctl_prop __user *p, int set)
 	if (put_user(param.ret, &p->ret))
 		ret = -EFAULT;
 
-out:
-	kfree(path);
+err_free_propval:
 	kfree(propval);
+err_free_propname:
 	kfree(propname);
+err_free_path:
+	kfree(path);
 
 	return ret;
 }
-- 
2.17.1
