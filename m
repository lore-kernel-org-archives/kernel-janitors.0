From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 20 Jan 2005 18:12:22 +0000
Subject: [KJ] [PATCH 1/40] acorn/fd1772: replace sleep_on() with wait_event()
Message-Id: <20050120181222.GB5393@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75814778139939287=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============75814778139939287==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event() instead of the deprecated sleep_on(). Since
wait_event() expects the condition upon which the loop should return, pass in
the negation of the current conditional.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc1-kj-v/drivers/acorn/block/fd1772.c	2005-01-15 16:55:44.000000000 -0800
+++ 2.6.11-rc1-kj/drivers/acorn/block/fd1772.c	2005-01-19 17:27:11.000000000 -0800
@@ -139,6 +139,7 @@
 #include <linux/delay.h>
 #include <linux/mm.h>
 #include <linux/bitops.h>
+#include <linux/wait.h>
 
 #include <asm/arch/oldlatches.h>
 #include <asm/dma.h>
@@ -1283,8 +1284,7 @@ static void do_fd_request(request_queue_
 	if (fdc_busy) return;
 	save_flags(flags);
 	cli();
-	while (fdc_busy)
-		sleep_on(&fdc_wait);
+	wait_event(fdc_wait, !fdc_busy);
 	fdc_busy = 1;
 	ENABLE_IRQ();
 	restore_flags(flags);

--===============75814778139939287==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75814778139939287==--
