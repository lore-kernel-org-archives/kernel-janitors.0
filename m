From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 20:45:25 +0000
Subject: [Kernel-janitors] [PATCH] isdn/boardergo: replace
Message-Id: <20040723204525.GH2675@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82240028366296247=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============82240028366296247==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. This is one (of
many) cases where I made a decision about replacing

set_current_state(TASK_INTERRUPTIBLE);
schedule_timeout(some_time);

with

msleep(jiffies_to_msecs(some_time));

msleep() is not exactly the same as the previous code, but I only did
this replacement where I thought long delays were *desired*. If this is
not the case here, then just disregard this patch. 

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/isdn/hysdn/boardergo.c	2004-06-16 05:19:26.000000000 +0000
+++ linux-dev/drivers/isdn/hysdn/boardergo.c	2004-07-12 18:07:54.000000000 +0000
@@ -246,8 +246,7 @@ ergo_writebootimg(struct HYSDN_CARD *car
 		/* the interrupts are still masked */
 
 		sti();
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout((20 * HZ) / 1000);	/* Timeout 20ms */
+		msleep(20);
 
 		if (((tDpramBootSpooler *) card->dpram)->Len != DPRAM_SPOOLER_DATA_SIZE) {
 			if (card->debug_flags & LOG_POF_CARD)
@@ -386,8 +385,7 @@ ergo_waitpofready(struct HYSDN_CARD *car
 			return (0);	/* success */
 		}		/* data has arrived */
 		sti();
-		set_current_state(TASK_INTERRUPTIBLE);
-		schedule_timeout((50 * HZ) / 1000);	/* Timeout 50ms */
+		msleep(50);
 	}			/* wait until timeout */
 
 	if (card->debug_flags & LOG_POF_CARD)

--===============82240028366296247==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82240028366296247==--
