From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 25 Jan 2005 23:14:04 +0000
Subject: [KJ] [PATCH] 12/34: cdrom/cdu31a: replace interruptible_sleep_on()
Message-Id: <20050125231404.GB12649@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============38256593095925995=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============38256593095925995==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_interruptible() instead of the deprecated
interruptible_sleep_on(). The patch is straight-forward as the macros should 
result in the same execution. Patch is compile-tested (still throws out warnings
regarding {save,restore}_flags()).

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/cdrom/cdu31a.c	2005-01-24 09:34:04.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/cdrom/cdu31a.c	2005-01-25 15:11:05.000000000 -0800
@@ -166,6 +166,7 @@
 #include <linux/slab.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
+#include <linux/wait.h>
 
 #include <asm/system.h>
 #include <asm/io.h>
@@ -865,15 +866,13 @@ do_sony_cd_cmd(unsigned char cmd,
 	save_flags(flags);
 	cli();
 	if (current != has_cd_task) {	/* Allow recursive calls to this routine */
-		while (sony_inuse) {
-			interruptible_sleep_on(&sony_wait);
-			if (signal_pending(current)) {
-				result_buffer[0] = 0x20;
-				result_buffer[1] = SONY_SIGNAL_OP_ERR;
-				*result_size = 2;
-				restore_flags(flags);
-				return;
-			}
+		wait_event_interruptible(sony_wait, !sony_inuse);
+		if (signal_pending(current)) {
+			result_buffer[0] = 0x20;
+			result_buffer[1] = SONY_SIGNAL_OP_ERR;
+			*result_size = 2;
+			restore_flags(flags);
+			return;
 		}
 		sony_inuse = 1;
 		has_cd_task = current;
@@ -1372,16 +1371,13 @@ static void do_cdu31a_request(request_qu
 	 */
 	save_flags(flags);
 	cli();
-	while (sony_inuse) {
-		interruptible_sleep_on(&sony_wait);
-		if (signal_pending(current)) {
-			restore_flags(flags);
+	wait_event_interruptible(sony_wait, !sony_inuse);
+	if (signal_pending(current)) {
+		restore_flags(flags);
 #if DEBUG
-			printk("Leaving do_cdu31a_request at %d\n",
-			       __LINE__);
+		printk("Leaving do_cdu31a_request at %d\n", __LINE__);
 #endif
-			return;
-		}
+		return;
 	}
 	sony_inuse = 1;
 	has_cd_task = current;
@@ -2326,12 +2322,10 @@ static int read_audio(struct cdrom_read_
 	 */
 	save_flags(flags);
 	cli();
-	while (sony_inuse) {
-		interruptible_sleep_on(&sony_wait);
-		if (signal_pending(current)) {
-			restore_flags(flags);
-			return -EAGAIN;
-		}
+	wait_event_interruptible(sony_wait, sony_inuse);
+	if (signal_pending(current)) {
+		restore_flags(flags);
+		return -EAGAIN;
 	}
 	sony_inuse = 1;
 	has_cd_task = current;

--===============38256593095925995==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============38256593095925995==--
