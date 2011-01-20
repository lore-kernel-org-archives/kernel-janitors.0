From: Vasiliy Kulikov <segoon@openwall.com>
Date: Thu, 20 Jan 2011 20:08:06 +0000
Subject: [PATCH] acpi: debugfs: fix buffer overflows, double free
Message-Id: <1295554086-23873-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org

File position is not controlled, it may lead to overwrites of arbitrary
kernel memory.  Also the code may kfree() the same pointer multiple
times.

One more flaw is still present: if multiple processes open the file then
all 3 static variables are shared, leading to various race conditions.
They should be moved to file->private_data.

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 drivers/acpi/debugfs.c |   20 ++++++++++++++------
 1 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/acpi/debugfs.c b/drivers/acpi/debugfs.c
index 5df67f1..384f7ab 100644
--- a/drivers/acpi/debugfs.c
+++ b/drivers/acpi/debugfs.c
@@ -26,7 +26,9 @@ static ssize_t cm_write(struct file *file, const char __user * user_buf,
 			size_t count, loff_t *ppos)
 {
 	static char *buf;
-	static int uncopied_bytes;
+	static u32 max_size;
+	static u32 uncopied_bytes;
+
 	struct acpi_table_header table;
 	acpi_status status;
 
@@ -37,19 +39,24 @@ static ssize_t cm_write(struct file *file, const char __user * user_buf,
 		if (copy_from_user(&table, user_buf,
 				   sizeof(struct acpi_table_header)))
 			return -EFAULT;
-		uncopied_bytes = table.length;
-		buf = kzalloc(uncopied_bytes, GFP_KERNEL);
+		uncopied_bytes = max_size = table.length;
+		buf = kzalloc(max_size, GFP_KERNEL);
 		if (!buf)
 			return -ENOMEM;
 	}
 
-	if (uncopied_bytes < count) {
-		kfree(buf);
+	if (buf = NULL)
+		return -EINVAL;
+
+	if ((*ppos > max_size) ||
+	    (*ppos + count > max_size) ||
+	    (*ppos + count < count) ||
+	    (count > uncopied_bytes))
 		return -EINVAL;
-	}
 
 	if (copy_from_user(buf + (*ppos), user_buf, count)) {
 		kfree(buf);
+		buf = NULL;
 		return -EFAULT;
 	}
 
@@ -59,6 +66,7 @@ static ssize_t cm_write(struct file *file, const char __user * user_buf,
 	if (!uncopied_bytes) {
 		status = acpi_install_method(buf);
 		kfree(buf);
+		buf = NULL;
 		if (ACPI_FAILURE(status))
 			return -EINVAL;
 		add_taint(TAINT_OVERRIDDEN_ACPI_TABLE);
-- 
1.7.0.4

