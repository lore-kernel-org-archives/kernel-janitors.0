From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 11 Nov 2005 17:39:39 +0000
Subject: [KJ] [PATCH] drivers/ide/ide-tape.c: use time_after, time_after_eq
Message-Id: <20051111173939.GA22130@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56486837341556884=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============56486837341556884==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From: Marcelo Feitoza Parisi

They deal with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi
Signed-off-by: Alexey Dobriyan

Index: linux-kj/drivers/ide/ide-tape.c
===================================================================
--- linux-kj.orig/drivers/ide/ide-tape.c	2005-11-11 17:56:08.000000000 +0300
+++ linux-kj/drivers/ide/ide-tape.c	2005-11-11 20:35:59.000000000 +0300
@@ -443,6 +443,7 @@
 #include <linux/smp_lock.h>
 #include <linux/completion.h>
 #include <linux/bitops.h>
+#include <linux/jiffies.h>
 
 #include <asm/byteorder.h>
 #include <asm/irq.h>
@@ -2335,7 +2336,7 @@ static ide_startstop_t idetape_rw_callba
 	}
 	if (time_after(jiffies, tape->insert_time))
 		tape->insert_speed = tape->insert_size / 1024 * HZ / (jiffies - tape->insert_time);
-	if (jiffies - tape->avg_time >= HZ) {
+	if (time_after_eq(jiffies, tape->avg_time + HZ)) {
 		tape->avg_speed = tape->avg_size * HZ / (jiffies - tape->avg_time) / 1024;
 		tape->avg_size = 0;
 		tape->avg_time = jiffies;
@@ -2496,7 +2497,7 @@ static ide_startstop_t idetape_do_reques
 			} else {
 				return ide_do_reset(drive);
 			}
-		} else if (jiffies - tape->dsc_polling_start > IDETAPE_DSC_MA_THRESHOLD)
+		} else if (time_after(jiffies, tape->dsc_polling_start + IDETAPE_DSC_MA_THRESHOLD))
 			tape->dsc_polling_frequency = IDETAPE_DSC_MA_SLOW;
 		idetape_postpone_request(drive);
 		return ide_stopped;


--===============56486837341556884==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56486837341556884==--
