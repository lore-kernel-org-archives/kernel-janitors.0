From: Timmy Yee <shoujun@masterofpi.org>
Date: Sat, 24 Jan 2004 03:53:12 +0000
Subject: [Kernel-janitors] [PATCH] swim3.c - convert cli to spinlock
Message-Id: <20040124035312.GA6136@masterofpi.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

This patch replaces the cli function calls with the spinlock function calls
for the swim3 driver.

--- linux-2.6.2-rc1/drivers/block/swim3.c	2003-08-09 18:19:06.000000000 -0700
+++ linux-2.6.2-rc1-mpi/drivers/block/swim3.c	2004-01-22 16:20:28.000000000 -0800
@@ -360,7 +360,7 @@
 {
 	unsigned long flags;
 
-	save_flags(flags); cli();
+	spin_lock_irqsave(&swim3_lock, flags);
 	if (fs->timeout_pending)
 		del_timer(&fs->timeout);
 	fs->timeout.expires = jiffies + nticks;
@@ -368,7 +368,7 @@
 	fs->timeout.data = (unsigned long) fs;
 	add_timer(&fs->timeout);
 	fs->timeout_pending = 1;
-	restore_flags(flags);
+	spin_unlock_irqrestore(&swim3_lock, flags);
 }
 
 static inline void scan_track(struct floppy_state *fs)
@@ -755,8 +755,7 @@
 {
 	unsigned long flags;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&swim3_lock, flags);
 	if (fs->state != idle) {
 		++fs->wanted;
 		while (fs->state != available) {
@@ -770,7 +769,7 @@
 		--fs->wanted;
 	}
 	fs->state = state;
-	restore_flags(flags);
+	spin_unlock_irqrestore(&swim3_lock, flags);
 	return 0;
 }
 
@@ -778,11 +777,10 @@
 {
 	unsigned long flags;
 
-	save_flags(flags);
-	cli();
+	spin_lock_irqsave(&swim3_lock, flags);
 	fs->state = idle;
 	start_request(fs);
-	restore_flags(flags);
+	spin_unlock_irqrestore(&swim3_lock, flags);
 }
 
 static int fd_eject(struct floppy_state *fs)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
