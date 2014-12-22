From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Dec 2014 07:52:39 +0000
Subject: [patch] Staging: lustre: error handling tweaks in obd_ioctl_getdata()
Message-Id: <20141222075239.GC9737@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

1)  The places which called copy_from_user() were returning the number
of bytes not copied instead of -EFAULT.

2) The user could trigger a memory leak if the condition
"(hdr.ioc_len != data->ioc_len)" was true.  Instead of adding a new call
to OBD_FREE_LARGE(), I created a free_buf label and changed everything
to use that label.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/lustre/lustre/obdclass/linux/linux-module.c b/drivers/staging/lustre/lustre/obdclass/linux/linux-module.c
index 66ceab2..346b75a 100644
--- a/drivers/staging/lustre/lustre/obdclass/linux/linux-module.c
+++ b/drivers/staging/lustre/lustre/obdclass/linux/linux-module.c
@@ -83,9 +83,8 @@ int obd_ioctl_getdata(char **buf, int *len, void *arg)
 	int err;
 	int offset = 0;
 
-	err = copy_from_user(&hdr, (void *)arg, sizeof(hdr));
-	if (err)
-		return err;
+	if (copy_from_user(&hdr, (void *)arg, sizeof(hdr)))
+		return -EFAULT;
 
 	if (hdr.ioc_version != OBD_IOCTL_VERSION) {
 		CERROR("Version mismatch kernel (%x) vs application (%x)\n",
@@ -117,18 +116,19 @@ int obd_ioctl_getdata(char **buf, int *len, void *arg)
 	*len = hdr.ioc_len;
 	data = (struct obd_ioctl_data *)*buf;
 
-	err = copy_from_user(*buf, (void *)arg, hdr.ioc_len);
-	if (err) {
-		OBD_FREE_LARGE(*buf, hdr.ioc_len);
-		return err;
+	if (copy_from_user(*buf, (void *)arg, hdr.ioc_len)) {
+		err = -EFAULT;
+		goto free_buf;
+	}
+	if (hdr.ioc_len != data->ioc_len) {
+		err = -EINVAL;
+		goto free_buf;
 	}
-	if (hdr.ioc_len != data->ioc_len)
-		return -EINVAL;
 
 	if (obd_ioctl_is_invalid(data)) {
 		CERROR("ioctl not correctly formatted\n");
-		OBD_FREE_LARGE(*buf, hdr.ioc_len);
-		return -EINVAL;
+		err = -EINVAL;
+		goto free_buf;
 	}
 
 	if (data->ioc_inllen1) {
@@ -151,6 +151,10 @@ int obd_ioctl_getdata(char **buf, int *len, void *arg)
 	}
 
 	return 0;
+
+free_buf:
+	OBD_FREE_LARGE(*buf, hdr.ioc_len);
+	return err;
 }
 EXPORT_SYMBOL(obd_ioctl_getdata);
 
