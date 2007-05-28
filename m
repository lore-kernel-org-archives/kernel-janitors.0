From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 28 May 2007 18:31:42 +0000
Subject: [KJ] [PATCH] BLUETOOTH: Remove the redundant non-seekable llseek
Message-Id: <Pine.LNX.4.64.0705281428440.14590@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Remove the llseek method given that the open method already calls
nonseekable_open().

Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

given that the fops open() method already calls nonseekable_open()
at the end, it would seem that this old-style method for preventing
lseeking is redundant.  am i reading that correctly?



diff --git a/drivers/bluetooth/hci_vhci.c b/drivers/bluetooth/hci_vhci.c
index b71a5cc..0638730 100644
--- a/drivers/bluetooth/hci_vhci.c
+++ b/drivers/bluetooth/hci_vhci.c
@@ -180,11 +180,6 @@ static inline ssize_t vhci_put_user(struct vhci_data *data,
 	return total;
 }

-static loff_t vhci_llseek(struct file *file, loff_t offset, int origin)
-{
-	return -ESPIPE;
-}
-
 static ssize_t vhci_read(struct file *file,
 				char __user *buf, size_t count, loff_t *pos)
 {
@@ -334,7 +329,6 @@ static int vhci_fasync(int fd, struct file *file, int on)

 static const struct file_operations vhci_fops = {
 	.owner		= THIS_MODULE,
-	.llseek		= vhci_llseek,
 	.read		= vhci_read,
 	.write		= vhci_write,
 	.poll		= vhci_poll,
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
