From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 26 Jan 2005 00:26:48 +0000
Subject: [KJ] [PATCH 26/34] mips/mirage_ts: replace
Message-Id: <20050126002648.GR12649@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85035355107652677=="
List-Id: <kernel-janitors.vger.kernel.org>
To: ralf@linux-mips.org
Cc: linux-mips@linux-mips.org, kernel-janitors@lists.osdl.org

--===============85035355107652677==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_timeout() instead of the deprecated
interruptible_sleep_on_timeout(). The current code does not seem to
care about signals, so interruptible seems unnecessary.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/arch/mips/au1000/db1x00/mirage_ts.c	2005-01-24 09:28:12.000000000 -0800
+++ 2.6.11-rc2-kj/arch/mips/au1000/db1x00/mirage_ts.c	2005-01-24 16:43:25.000000000 -0800
@@ -42,6 +42,7 @@
 #include <linux/proc_fs.h>
 #include <linux/smp.h>
 #include <linux/smp_lock.h>
+#include <linux/wait.h>
 
 #include <asm/segment.h>
 #include <asm/irq.h>
@@ -147,10 +148,7 @@ static int ts_thread(void *id)
 	ts = wm97xx_ts_get_handle(0);
 
 	/* proceed only after everybody is ready */
-	while ( ! wm97xx_ts_ready(ts) ) {
-		/* give a little time for initializations to complete */
-		interruptible_sleep_on_timeout(&pendown_wait, HZ / 4);
-	}
+	wait_event_timeout(pendown_wait, wm97xx_ts_ready(ts), HZ/4);
 
 	/* board-specific calibration */
 	wm97xx_ts_set_cal(ts,

--===============85035355107652677==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85035355107652677==--
