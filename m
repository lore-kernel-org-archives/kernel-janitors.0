From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 25 Jan 2005 22:57:56 +0000
Subject: [KJ] [PATCH] 10/34: block/xd: remove sleep_on() usage
Message-Id: <20050125225756.GK2689@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57075201657117414=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============57075201657117414==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Directly use wait-queues instead of the deprecated sleep_on().
This required adding a local waitqueue. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/drivers/block/xd.c	2005-01-25 14:55:01.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/block/xd.c	2005-01-25 14:56:10.000000000 -0800
@@ -538,6 +538,7 @@ static inline u_char xd_waitport (u_shor
 
 static inline u_int xd_wait_for_IRQ (void)
 {
+	DEFINE_WAIT(wait);
 	unsigned long flags;
 	xd_watchdog_int.expires = jiffies + 8 * HZ;
 	add_timer(&xd_watchdog_int);
@@ -546,7 +547,9 @@ static inline u_int xd_wait_for_IRQ (voi
 	enable_dma(xd_dma);
 	release_dma_lock(flags);
 	
-	sleep_on(&xd_wait_int);
+	prepare_to_wait(&xd_wait_int, &wait, TASK_UNINTERRUPTIBLE);
+	schedule();
+	finish_wait(&xd_wait_int, &wait);
 	del_timer(&xd_watchdog_int);
 	xdc_busy = 0;
 	

--===============57075201657117414==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57075201657117414==--
