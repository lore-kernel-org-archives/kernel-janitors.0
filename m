From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Sep 2013 08:12:28 +0000
Subject: [patch] i40e: fix copy_from_user() error handling
Message-Id: <20130913081228.GJ19211@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There can never be a negative number of bytes_not_copied.  Also return
-EFAULT on error.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/intel/i40e/i40e_debugfs.c b/drivers/net/ethernet/intel/i40e/i40e_debugfs.c
index 8dbd91f..de9f60d 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_debugfs.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_debugfs.c
@@ -93,7 +93,6 @@ static ssize_t i40e_dbg_dump_buffer_len;
 static ssize_t i40e_dbg_dump_read(struct file *filp, char __user *buffer,
 				  size_t count, loff_t *ppos)
 {
-	int bytes_not_copied;
 	int len;
 
 	/* is *ppos bigger than the available data? */
@@ -103,9 +102,8 @@ static ssize_t i40e_dbg_dump_read(struct file *filp, char __user *buffer,
 	/* be sure to not read beyond the end of available data */
 	len = min_t(int, count, (i40e_dbg_dump_data_len - *ppos));
 
-	bytes_not_copied = copy_to_user(buffer, &i40e_dbg_dump_buf[*ppos], len);
-	if (bytes_not_copied < 0)
-		return bytes_not_copied;
+	if (copy_to_user(buffer, &i40e_dbg_dump_buf[*ppos], len))
+		return -EFAULT;
 
 	*ppos += len;
 	return len;
@@ -153,7 +151,6 @@ static ssize_t i40e_dbg_dump_write(struct file *filp,
 	struct i40e_pf *pf = filp->private_data;
 	char dump_request_buf[16];
 	bool seid_found = false;
-	int bytes_not_copied;
 	long seid = -1;
 	int buflen = 0;
 	int i, ret;
@@ -166,11 +163,8 @@ static ssize_t i40e_dbg_dump_write(struct file *filp,
 	if (count >= sizeof(dump_request_buf))
 		return -ENOSPC;
 
-	bytes_not_copied = copy_from_user(dump_request_buf, buffer, count);
-	if (bytes_not_copied < 0)
-		return bytes_not_copied;
-	if (bytes_not_copied > 0)
-		count -= bytes_not_copied;
+	if (copy_from_user(dump_request_buf, buffer, count))
+		return -EFAULT;
 	dump_request_buf[count] = '\0';
 
 	/* decode the SEID given to be dumped */
@@ -357,9 +351,8 @@ static ssize_t i40e_dbg_command_read(struct file *filp, char __user *buffer,
 
 	bytes_not_copied = copy_to_user(buffer, buf, len);
 	kfree(buf);
-
-	if (bytes_not_copied < 0)
-		return bytes_not_copied;
+	if (bytes_not_copied)
+		return -EFAULT;
 
 	*ppos = len;
 	return len;
@@ -1028,7 +1021,6 @@ static ssize_t i40e_dbg_command_write(struct file *filp,
 				      size_t count, loff_t *ppos)
 {
 	struct i40e_pf *pf = filp->private_data;
-	int bytes_not_copied;
 	struct i40e_vsi *vsi;
 	u8 *print_buf_start;
 	u8 *print_buf;
@@ -1044,11 +1036,8 @@ static ssize_t i40e_dbg_command_write(struct file *filp,
 	cmd_buf = kzalloc(count + 1, GFP_KERNEL);
 	if (!cmd_buf)
 		return count;
-	bytes_not_copied = copy_from_user(cmd_buf, buffer, count);
-	if (bytes_not_copied < 0)
-		return bytes_not_copied;
-	if (bytes_not_copied > 0)
-		count -= bytes_not_copied;
+	if (copy_from_user(cmd_buf, buffer, count))
+		return -EFAULT;
 	cmd_buf[count] = '\0';
 
 	print_buf_start = kzalloc(I40E_MAX_DEBUG_OUT_BUFFER, GFP_KERNEL);
@@ -1881,9 +1870,8 @@ static ssize_t i40e_dbg_netdev_ops_read(struct file *filp, char __user *buffer,
 
 	bytes_not_copied = copy_to_user(buffer, buf, len);
 	kfree(buf);
-
-	if (bytes_not_copied < 0)
-		return bytes_not_copied;
+	if (bytes_not_copied)
+		return -EFAULT;
 
 	*ppos = len;
 	return len;
@@ -1901,7 +1889,6 @@ static ssize_t i40e_dbg_netdev_ops_write(struct file *filp,
 					 size_t count, loff_t *ppos)
 {
 	struct i40e_pf *pf = filp->private_data;
-	int bytes_not_copied;
 	struct i40e_vsi *vsi;
 	int vsi_seid;
 	int i, cnt;
@@ -1913,12 +1900,8 @@ static ssize_t i40e_dbg_netdev_ops_write(struct file *filp,
 		return -ENOSPC;
 
 	memset(i40e_dbg_netdev_ops_buf, 0, sizeof(i40e_dbg_netdev_ops_buf));
-	bytes_not_copied = copy_from_user(i40e_dbg_netdev_ops_buf,
-					  buffer, count);
-	if (bytes_not_copied < 0)
-		return bytes_not_copied;
-	else if (bytes_not_copied > 0)
-		count -= bytes_not_copied;
+	if (copy_from_user(i40e_dbg_netdev_ops_buf, buffer, count))
+		return -EFAULT;
 	i40e_dbg_netdev_ops_buf[count] = '\0';
 
 	if (strncmp(i40e_dbg_netdev_ops_buf, "tx_timeout", 10) = 0) {
