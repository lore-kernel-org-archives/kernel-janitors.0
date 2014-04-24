From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Apr 2014 21:49:13 +0000
Subject: [patch 1/2] staging: lustre: improve length checks in ioctls
Message-Id: <20140424214913.GA10490@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We copy "hdr->ioc_len" from the user twice but we only verify that it's
within the limit on the first copy.  Otherwise we could read unmapped
memory and Oops.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.

diff --git a/drivers/staging/lustre/lustre/obdclass/linux/linux-module.c b/drivers/staging/lustre/lustre/obdclass/linux/linux-module.c
index e4e94cc..dec1037 100644
--- a/drivers/staging/lustre/lustre/obdclass/linux/linux-module.c
+++ b/drivers/staging/lustre/lustre/obdclass/linux/linux-module.c
@@ -122,6 +122,8 @@ int obd_ioctl_getdata(char **buf, int *len, void *arg)
 		OBD_FREE_LARGE(*buf, hdr.ioc_len);
 		return err;
 	}
+	if (hdr.ioc_len != data->ioc_len)
+		return -EINVAL;
 
 	if (obd_ioctl_is_invalid(data)) {
 		CERROR("ioctl not correctly formatted\n");
diff --git a/drivers/staging/lustre/lustre/libcfs/linux/linux-module.c b/drivers/staging/lustre/lustre/libcfs/linux/linux-module.c
index e6eae06..9a3b07b 100644
--- a/drivers/staging/lustre/lustre/libcfs/linux/linux-module.c
+++ b/drivers/staging/lustre/lustre/libcfs/linux/linux-module.c
@@ -44,6 +44,7 @@ int libcfs_ioctl_getdata(char *buf, char *end, void *arg)
 {
 	struct libcfs_ioctl_hdr   *hdr;
 	struct libcfs_ioctl_data  *data;
+	int orig_len;
 	int err;
 
 	hdr = (struct libcfs_ioctl_hdr *)buf;
@@ -69,9 +70,12 @@ int libcfs_ioctl_getdata(char *buf, char *end, void *arg)
 		return -EINVAL;
 	}
 
+	orig_len = hdr->ioc_len;
 	err = copy_from_user(buf, (void *)arg, hdr->ioc_len);
 	if (err)
 		return err;
+	if (orig_len != data->ioc_len)
+		return -EINVAL;
 
 	if (libcfs_ioctl_is_invalid(data)) {
 		CERROR("PORTALS: ioctl not correctly formatted\n");
