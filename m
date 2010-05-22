From: Julia Lawall <julia@diku.dk>
Date: Sat, 22 May 2010 08:26:22 +0000
Subject: [PATCH 25/27] drivers/usb/gadget: Use memdup_user
Message-Id: <Pine.LNX.4.64.1005221026050.13021@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Brownell <dbrownell@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Use memdup_user when user data is immediately copied into the
allocated region.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression from,to,size,flag;
position p;
identifier l1,l2;
@@

-  to = \(kmalloc@p\|kzalloc@p\)(size,flag);
+  to = memdup_user(from,size);
   if (
-      to=NULL
+      IS_ERR(to)
                 || ...) {
   <+... when != goto l1;
-  -ENOMEM
+  PTR_ERR(to)
   ...+>
   }
-  if (copy_from_user(to, from, size) != 0) {
-    <+... when != goto l2;
-    -EFAULT
-    ...+>
-  }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/usb/gadget/inode.c |   10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/inode.c b/drivers/usb/gadget/inode.c
index de8a838..63fc171 100644
--- a/drivers/usb/gadget/inode.c
+++ b/drivers/usb/gadget/inode.c
@@ -1867,13 +1867,9 @@ dev_config (struct file *fd, const char __user *buf, size_t len, loff_t *ptr)
 	buf += 4;
 	length -= 4;
 
-	kbuf = kmalloc (length, GFP_KERNEL);
-	if (!kbuf)
-		return -ENOMEM;
-	if (copy_from_user (kbuf, buf, length)) {
-		kfree (kbuf);
-		return -EFAULT;
-	}
+	kbuf = memdup_user(buf, length);
+	if (IS_ERR(kbuf))
+		return PTR_ERR(kbuf);
 
 	spin_lock_irq (&dev->lock);
 	value = -EINVAL;
