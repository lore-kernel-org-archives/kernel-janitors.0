From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 25 Jan 2005 22:28:13 +0000
Subject: [KJ] [PATCH] 6/34: block/ataflop: replace sleep_on() with
Message-Id: <20050125222813.GG2689@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66609347029437815=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============66609347029437815==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event() instead of the deprecated sleep_on(). These
replacements are straight-forward. The middle change is more difficult, as it is
not a conditional sleep. Therefore, I have converted it to directly use a
locally defined wait-queue.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/block/ataflop.c	2005-01-24 09:34:04.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/block/ataflop.c	2005-01-25 14:27:36.000000000 -0800
@@ -67,6 +67,7 @@
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/blkdev.h>
+#include <linux/wait.h>
 
 #include <asm/atafd.h>
 #include <asm/atafdreg.h>
@@ -643,6 +644,7 @@ static void fd_error( void )
 
 static int do_format(int drive, int type, struct atari_format_descr *desc)
 {
+	DEFINE_WAIT(wait);
 	unsigned char	*p;
 	int sect, nsect;
 	unsigned long	flags;
@@ -651,7 +653,7 @@ static int do_format(int drive, int type
 		drive, desc->track, desc->head, desc->sect_offset ));
 
 	local_irq_save(flags);
-	while( fdc_busy ) sleep_on( &fdc_wait );
+	wait_event(fdc_wait, !fdc_busy);
 	fdc_busy = 1;
 	stdma_lock(floppy_irq, NULL);
 	atari_turnon_irq( IRQ_MFP_FDC ); /* should be already, just to be sure */
@@ -706,7 +708,9 @@ static int do_format(int drive, int type
 	ReqSide  = desc->head;
 	do_fd_action( drive );
 
-	sleep_on( &format_wait );
+	prepare_to_wait(&format_wait, &wait, TASK_UNINTERRUPTIBLE);
+	schedule();
+	finish_wait(&format_wait, &wait);
 
 	redo_fd_request();
 	return( FormatError ? -EIO : 0 );	
@@ -1477,7 +1481,7 @@ void do_fd_request(request_queue_t * q)
  	unsigned long flags;
 
 	DPRINT(("do_fd_request for pid %d\n",current->pid));
-	while( fdc_busy ) sleep_on( &fdc_wait );
+	wait_event(fdc_wait, !fdc_busy);
 	fdc_busy = 1;
 	stdma_lock(floppy_irq, NULL);
 

--===============66609347029437815==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66609347029437815==--
