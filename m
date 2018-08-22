From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Aug 2018 10:41:26 +0000
Subject: [PATCH] rt2x00: use simple_read_from_buffer()
Message-Id: <20180822104126.2logh4tqxkmiomqy@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stanislaw Gruszka <sgruszka@redhat.com>
Cc: Helmut Schaa <helmut.schaa@googlemail.com>, Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

The problem with this copy_to_user() calls is that they don't ensure
that "size" is less than the "length" which the user provided.

Obviously, this is debugfs and "size" is normally going to be very small
so it probably doesn't matter, but this is the correct thing to do.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
From static analysis.  Not tested.

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2x00debug.c b/drivers/net/wireless/ralink/rt2x00/rt2x00debug.c
index acc399b5574e..61ba573e8bf1 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2x00debug.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2x00debug.c
@@ -464,11 +464,7 @@ static ssize_t rt2x00debug_read_##__name(struct file *file,	\
 								\
 	size = sprintf(line, __format, value);			\
 								\
-	if (copy_to_user(buf, line, size))			\
-		return -EFAULT;					\
-								\
-	*offset += size;					\
-	return size;						\
+	return simple_read_from_buffer(buf, length, offset, line, size); \
 }
 
 #define RT2X00DEBUGFS_OPS_WRITE(__name, __type)			\
@@ -545,11 +541,7 @@ static ssize_t rt2x00debug_read_dev_flags(struct file *file,
 
 	size = sprintf(line, "0x%.8x\n", (unsigned int)intf->rt2x00dev->flags);
 
-	if (copy_to_user(buf, line, size))
-		return -EFAULT;
-
-	*offset += size;
-	return size;
+	return simple_read_from_buffer(buf, length, offset, line, size);
 }
 
 static const struct file_operations rt2x00debug_fop_dev_flags = {
@@ -574,11 +566,7 @@ static ssize_t rt2x00debug_read_cap_flags(struct file *file,
 
 	size = sprintf(line, "0x%.8x\n", (unsigned int)intf->rt2x00dev->cap_flags);
 
-	if (copy_to_user(buf, line, size))
-		return -EFAULT;
-
-	*offset += size;
-	return size;
+	return simple_read_from_buffer(buf, length, offset, line, size);
 }
 
 static const struct file_operations rt2x00debug_fop_cap_flags = {
