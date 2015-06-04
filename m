From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Jun 2015 08:59:34 +0000
Subject: [patch] staging: wilc1000: prevent some overflows in debugfs
Message-Id: <20150604085934.GC22838@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Add some limits here so we don't corrupt memory.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/wilc1000/wilc_debugfs.c b/drivers/staging/wilc1000/wilc_debugfs.c
index 74b9fd5..c328208 100644
--- a/drivers/staging/wilc1000/wilc_debugfs.c
+++ b/drivers/staging/wilc1000/wilc_debugfs.c
@@ -53,6 +53,9 @@ static ssize_t wilc_debug_level_write(struct file *filp, const char *buf, size_t
 	char buffer[128] = {};
 	int flag = 0;
 
+	if (count > sizeof(buffer))
+		return -EINVAL;
+
 	if (copy_from_user(buffer, buf, count)) {
 		return -EFAULT;
 	}
@@ -99,6 +102,9 @@ static ssize_t wilc_debug_region_write(struct file *filp, const char *buf, size_
 	char buffer[128] = {};
 	int flag;
 
+	if (count > sizeof(buffer))
+		return -EINVAL;
+
 	if (copy_from_user(buffer, buf, count)) {
 		return -EFAULT;
 	}
