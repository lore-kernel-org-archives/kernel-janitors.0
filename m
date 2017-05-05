From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 05 May 2017 05:34:58 +0000
Subject: [PATCH] cxl: Unlock on error in probe
Message-Id: <20170505053458.csrwd2kjber44r4o@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Munsie <imunsie@au1.ibm.com>, Christophe Lombard <clombard@linux.vnet.ibm.com>
Cc: Frederic Barrat <fbarrat@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org

We should unlock if get_cxl_adapter() fails.

Fixes: 594ff7d067ca ("cxl: Support to flash a new image on the adapter from a guest")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/cxl/flash.c b/drivers/misc/cxl/flash.c
index 7c61c70ba3f6..37475abea3e6 100644
--- a/drivers/misc/cxl/flash.c
+++ b/drivers/misc/cxl/flash.c
@@ -401,8 +401,10 @@ static int device_open(struct inode *inode, struct file *file)
 	if (down_interruptible(&sem) != 0)
 		return -EPERM;
 
-	if (!(adapter = get_cxl_adapter(adapter_num)))
-		return -ENODEV;
+	if (!(adapter = get_cxl_adapter(adapter_num))) {
+		rc = -ENODEV;
+		goto err_unlock;
+	}
 
 	file->private_data = adapter;
 	continue_token = 0;
@@ -446,6 +448,8 @@ static int device_open(struct inode *inode, struct file *file)
 		free_page((unsigned long) le);
 err:
 	put_device(&adapter->dev);
+err_unlock:
+	up(&sem);
 
 	return rc;
 }
