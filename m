From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 20 Jan 2005 18:21:34 +0000
Subject: [KJ] [PATCH 3/40] block/amiflop: replace sleep_on() with
Message-Id: <20050120182134.GD5393@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============47964637081675887=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============47964637081675887==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event() instead of the deprecated sleep_on(). In all
replacements, wait_event() expects the condition to *stop* on, so the existing
conditional is negated and passed as the parameter.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/block/amiflop.c	2005-01-15 16:55:43.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/block/amiflop.c	2005-01-19 17:45:11.000000000 -0800
@@ -64,6 +64,7 @@
 #include <linux/buffer_head.h>
 #include <linux/blkdev.h>
 #include <linux/elevator.h>
+#include <linux/wait.h>
 
 #include <asm/setup.h>
 #include <asm/uaccess.h>
@@ -221,8 +222,7 @@ static void ms_delay(int ms)
 	int ticks;
 	if (ms > 0) {
 		local_irq_save(flags);
-		while (ms_busy == 0)
-			sleep_on(&ms_wait);
+		wait_event(ms_wait, (ms_busy != 0));
 		ms_busy = 0;
 		local_irq_restore(flags);
 		ticks = MS_TICKS*ms-1;
@@ -251,8 +251,7 @@ static void get_fdc(int drive)
 	printk("get_fdc: drive %d  fdc_busy %d  fdc_nested %d\n",drive,fdc_busy,fdc_nested);
 #endif
 	local_irq_save(flags);
-	while (!try_fdc(drive))
-		sleep_on(&fdc_wait);
+	wait_event(fdc_wait, try_fdc(drive));
 	fdc_busy = drive;
 	fdc_nested++;
 	local_irq_restore(flags);
@@ -579,8 +578,7 @@ static void raw_read(int drive)
 {
 	drive&=3;
 	get_fdc(drive);
-	while (block_flag)
-		sleep_on(&wait_fd_block);
+	wait_event(wait_fd_block, !block_flag);
 	fd_select(drive);
 	/* setup adkcon bits correctly */
 	custom.adkcon = ADK_MSBSYNC;
@@ -595,8 +593,7 @@ static void raw_read(int drive)
 
 	block_flag = 1;
 
-	while (block_flag)
-		sleep_on (&wait_fd_block);
+	wait_event(wait_fd_block, !block_flag);
 
 	custom.dsklen = 0;
 	fd_deselect(drive);
@@ -613,8 +610,7 @@ static int raw_write(int drive)
 		rel_fdc();
 		return 0;
 	}
-	while (block_flag)
-		sleep_on(&wait_fd_block);
+	wait_event(wait_fd_block, !block_flag);
 	fd_select(drive);
 	/* clear adkcon bits */
 	custom.adkcon = ADK_PRECOMP1|ADK_PRECOMP0|ADK_WORDSYNC|ADK_MSBSYNC;
@@ -1291,8 +1287,7 @@ static int non_int_flush_track (unsigned
 			writepending = 0;
 			return 0;
 		}
-		while (block_flag == 2)
-			sleep_on (&wait_fd_block);
+		wait_event(wait_fd_block, (block_flag != 2));
 	}
 	else {
 		local_irq_restore(flags);

--===============47964637081675887==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============47964637081675887==--
