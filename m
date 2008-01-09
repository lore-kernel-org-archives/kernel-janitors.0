From: Nikanth Karthikesan <knikanth@suse.de>
Date: Wed, 09 Jan 2008 05:51:40 +0000
Subject: [PATCH] Change x86 Machine check handler to use unlocked_iocl instead
Message-Id: <4785B342.2070501@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The Machine check handler registers ioctl handler that is called
with the BKL held. Changing to register unlocked_ioctl instead.
Also mce ioctl handler does not seem to need any lock protection.

To: Andi Kleen <andi@firstfloor.org>
Cc: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

Change the Machine check handler to use unlocked_ioctl instead of
ioctl handler. Also the mce ioctl handler does not need any lock
protection.

Signed-off-by: Nikanth Karthikesan <knikanth@suse.de>

---

diff --git a/arch/x86/kernel/cpu/mcheck/mce_64.c
b/arch/x86/kernel/cpu/mcheck/mce_64.c
index 4b21d29..d3baa62 100644
--- a/arch/x86/kernel/cpu/mcheck/mce_64.c
+++ b/arch/x86/kernel/cpu/mcheck/mce_64.c
@@ -634,8 +634,7 @@ static unsigned int mce_poll(struct file *file,
poll_table *wait)
 	return 0;
 }

-static int mce_ioctl(struct inode *i, struct file *f,unsigned int cmd,
-		     unsigned long arg)
+static long mce_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 {
 	int __user *p = (int __user *)arg;

@@ -664,7 +663,7 @@ static const struct file_operations mce_chrdev_ops = {
 	.release = mce_release,
 	.read = mce_read,
 	.poll = mce_poll,
-	.ioctl = mce_ioctl,
+	.unlocked_ioctl = mce_ioctl,
 };

 static struct miscdevice mce_log_device = {
