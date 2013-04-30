From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 30 Apr 2013 07:28:14 +0000
Subject: [patch] configfs: use capped length for ->store_attribute()
Message-Id: <20130430072813.GC7237@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Becker <jlbec@evilplan.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The difference between "count" and "len" is that "len" is capped at
4095.  Changing it like this makes it match how sysfs_write_file() is
implemented.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is a static analysis patch.  I haven't found any store_attribute()
functions where this change makes a difference.

diff --git a/fs/configfs/file.c b/fs/configfs/file.c
index 2b6cb23..1d1c41f 100644
--- a/fs/configfs/file.c
+++ b/fs/configfs/file.c
@@ -203,7 +203,7 @@ configfs_write_file(struct file *file, const char __user *buf, size_t count, lof
 	mutex_lock(&buffer->mutex);
 	len = fill_write_buffer(buffer, buf, count);
 	if (len > 0)
-		len = flush_write_buffer(file->f_path.dentry, buffer, count);
+		len = flush_write_buffer(file->f_path.dentry, buffer, len);
 	if (len > 0)
 		*ppos += len;
 	mutex_unlock(&buffer->mutex);
