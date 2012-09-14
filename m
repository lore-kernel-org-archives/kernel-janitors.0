From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Sep 2012 08:11:35 +0000
Subject: [patch 2/2] Staging: silicom: use kstrtoint_from_user()
Message-Id: <20120914081135.GA11315@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The main problem with the hand rolled code was that there weren't any
range checks so you could corrupt memory by writing too much data to
the proc file.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/silicom/bp_mod.c b/drivers/staging/silicom/bp_mod.c
index 1b3f5e7..f138d29 100644
--- a/drivers/staging/silicom/bp_mod.c
+++ b/drivers/staging/silicom/bp_mod.c
@@ -8071,20 +8071,13 @@ int
 set_bypass_wd_pfs(struct file *file, const char *buffer,
 		  unsigned long count, void *data)
 {
-
-	char kbuf[256];
 	bpctl_dev_t *pbp_device_block = (bpctl_dev_t *) data;
+	int timeout;
+	int ret;
 
-	unsigned int timeout = 0;
-	char *timeout_ptr = kbuf;
-
-	if (copy_from_user(&kbuf, buffer, count)) {
-		return -1;
-	}
-
-	timeout_ptr = kbuf;
-	timeout = atoi(&timeout_ptr);
-
+	ret = kstrtoint_from_user(buffer, count, 10, &timeout);
+	if (ret)
+		return ret;
 	set_bypass_wd_fn(pbp_device_block, timeout);
 
 	return count;
@@ -8712,18 +8705,13 @@ int
 set_wd_autoreset_pfs(struct file *file, const char *buffer,
 		     unsigned long count, void *data)
 {
-	char kbuf[256];
 	bpctl_dev_t *pbp_device_block = (bpctl_dev_t *) data;
-	u32 timeout = 0;
-	char *timeout_ptr = kbuf;
-
-	if (copy_from_user(&kbuf, buffer, count)) {
-		return -1;
-	}
-
-	timeout_ptr = kbuf;
-	timeout = atoi(&timeout_ptr);
+	int timeout;
+	int ret;
 
+	ret = kstrtoint_from_user(buffer, count, 10, &timeout);
+	if (ret)
+		return ret;
 	set_wd_autoreset_fn(pbp_device_block, timeout);
 
 	return count;
