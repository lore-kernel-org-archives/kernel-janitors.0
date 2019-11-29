From: Jeremy Kerr <jk@ozlabs.org>
Date: Fri, 29 Nov 2019 03:24:29 +0000
Subject: [PATCH] [PATCH v2] fsi: fix bogus error returns from cfam_read and cfam_write
Message-Id: <20191129032429.817-1-jk@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191122233120.110344-1-colin.king@canonical.com>
In-Reply-To: <20191122233120.110344-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Stanley <joel@jms.id.au>, Alistar Popple <alistair@popple.id.au>, Eddie James <eajames@linux.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Colin King <colin.king@canonical.com>, linux-fsi@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Based on a static analysis report and original patch from Colin Ian King
<colin.king@canonical.com>.

Currently, we may drop error values from cfam_read and cfam_write. This
change returns the actual error on failure, but a partial read/write will
take precedence.

Addresses-Coverity: ("Unused value")
Fixes: d1dcd6782576 ("fsi: Add cfam char devices")
Reported-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
Colin: thanks for the report and patch. I think this is a more complete
fix, as we want to preseve any partial read/write status if a failure
happens mid-way through an operation. Let me know if you (or the
coverity analysis) have any feedback.

---

 drivers/fsi/fsi-core.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
index 71c6f9fef648..3158a78c2e94 100644
--- a/drivers/fsi/fsi-core.c
+++ b/drivers/fsi/fsi-core.c
@@ -699,6 +699,8 @@ static ssize_t cfam_read(struct file *filep, char __user *buf, size_t count,
 	if (off > 0xffffffff || count > 0xffffffff || off + count > 0xffffffff)
 		return -EINVAL;
 
+	rc = 0;
+
 	for (total_len = 0; total_len < count; total_len += read_len) {
 		__be32 data;
 
@@ -707,18 +709,22 @@ static ssize_t cfam_read(struct file *filep, char __user *buf, size_t count,
 
 		rc = fsi_slave_read(slave, off, &data, read_len);
 		if (rc)
-			goto fail;
+			break;
 		rc = copy_to_user(buf + total_len, &data, read_len);
 		if (rc) {
 			rc = -EFAULT;
-			goto fail;
+			break;
 		}
 		off += read_len;
 	}
-	rc = count;
- fail:
+
+	/* if we've read any data, we want that to be returned in
+	 * preference to an error state */
+	if (total_len)
+		rc = total_len;
+
 	*offset = off;
-	return count;
+	return rc;
 }
 
 static ssize_t cfam_write(struct file *filep, const char __user *buf,
@@ -736,6 +742,8 @@ static ssize_t cfam_write(struct file *filep, const char __user *buf,
 	if (off > 0xffffffff || count > 0xffffffff || off + count > 0xffffffff)
 		return -EINVAL;
 
+	rc = 0;
+
 	for (total_len = 0; total_len < count; total_len += write_len) {
 		__be32 data;
 
@@ -745,17 +753,21 @@ static ssize_t cfam_write(struct file *filep, const char __user *buf,
 		rc = copy_from_user(&data, buf + total_len, write_len);
 		if (rc) {
 			rc = -EFAULT;
-			goto fail;
+			break;
 		}
 		rc = fsi_slave_write(slave, off, &data, write_len);
 		if (rc)
-			goto fail;
+			break;
 		off += write_len;
 	}
-	rc = count;
- fail:
+
+	/* if we've written any data, we want to indicate that partial write
+	 * instead of any mid-stream error */
+	if (total_len)
+		rc = total_len;
+
 	*offset = off;
-	return count;
+	return rc;
 }
 
 static loff_t cfam_llseek(struct file *file, loff_t offset, int whence)
-- 
2.20.1
