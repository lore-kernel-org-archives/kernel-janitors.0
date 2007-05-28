From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 28 May 2007 18:42:19 +0000
Subject: [KJ] [PATCH] PPC: Remove dead code for preventing pread() and
Message-Id: <Pine.LNX.4.64.0705281435450.14652@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Remove the deactivated code for checking for pread() and pwrite()
calls on the PPC-based BRIQ.

Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

  perusing the code, there's nothing that indicates lseeking should be
prevented, and the code to check that is "if 0"ed out, anyway.

  not sure which PPC person is the right contact for this.


diff --git a/drivers/char/briq_panel.c b/drivers/char/briq_panel.c
index ed53f54..b6f2639 100644
--- a/drivers/char/briq_panel.c
+++ b/drivers/char/briq_panel.c
@@ -91,11 +91,6 @@ static ssize_t briq_panel_read(struct file *file, char __user *buf, size_t count
 	unsigned short c;
 	unsigned char cp;

-#if 0	/*  Can't seek (pread) on this device  */
-	if (ppos != &file->f_pos)
-		return -ESPIPE;
-#endif
-
 	if (!vfd_is_open)
 		return -ENODEV;

@@ -139,11 +134,6 @@ static ssize_t briq_panel_write(struct file *file, const char __user *buf, size_
 	size_t indx = len;
 	int i, esc = 0;

-#if 0	/*  Can't seek (pwrite) on this device  */
-	if (ppos != &file->f_pos)
-		return -ESPIPE;
-#endif
-
 	if (!vfd_is_open)
 		return -EBUSY;

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
