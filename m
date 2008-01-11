From: Nikanth Karthikesan <knikanth@suse.de>
Date: Fri, 11 Jan 2008 11:51:52 +0000
Subject: [PATCH] Random number driver: make random_ioctl as an
Message-Id: <1200051592.3844.63.camel@nikanth-laptop.blr.novell.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mpm@selenic.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The random_ioctl is registered as an ioctl function but it does not
require BKL to be held when called. Changing it as an unlocked_ioctl
function.

Signed-off-by: Nikanth Karthikesan <knikanth@suse.de>

---
diff --git a/drivers/char/random.c b/drivers/char/random.c
index 5fee056..2446e14 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -1065,9 +1065,8 @@ random_write(struct file * file, const char __user * buffer,
 	return (ssize_t)count;
 }
 
-static int
-random_ioctl(struct inode * inode, struct file * file,
-	     unsigned int cmd, unsigned long arg)
+static long
+random_ioctl(struct file * file, unsigned int cmd, unsigned long arg)
 {
 	int size, ent_count;
 	int __user *p = (int __user *)arg;
@@ -1131,13 +1130,13 @@ const struct file_operations random_fops = {
 	.read  = random_read,
 	.write = random_write,
 	.poll  = random_poll,
-	.ioctl = random_ioctl,
+	.unlocked_ioctl = random_ioctl,
 };
 
 const struct file_operations urandom_fops = {
 	.read  = urandom_read,
 	.write = random_write,
-	.ioctl = random_ioctl,
+	.unlocked_ioctl = random_ioctl,
 };
 
 /***************************************************************


