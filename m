From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sat, 24 Mar 2007 15:17:25 +0000
Subject: [KJ] [PATCH] Replace MAJOR() macro invocation with imajor() call.
Message-Id: <Pine.LNX.4.64.0703241115150.5755@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Replace the use of the MAJOR() macro invocation with the preferred
call to the inline function imajor().

Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

  sure, it's picky, but LDD3 does encourage the use of the iminor()
and imajor() macros when it's appropriate.


diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 6b5b642..08da15b 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -710,7 +710,7 @@ static inline int is_loop_device(struct file *file)
 {
 	struct inode *i = file->f_mapping->host;

-	return i && S_ISBLK(i->i_mode) && MAJOR(i->i_rdev) = LOOP_MAJOR;
+	return i && S_ISBLK(i->i_mode) && imajor(i) = LOOP_MAJOR;
 }

 static int loop_set_fd(struct loop_device *lo, struct file *lo_file,
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
