From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 22 Jul 2004 22:22:53 +0000
Subject: [Kernel-janitors] [PATCH] ide-cd: replace schedule_timeout() with
Message-Id: <20040722222253.GR2165@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6886352648981382=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============6886352648981382==
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
not the case here, then just disregard this patch. I think in this case,
though, because of the while() loop, this was the desired effect.

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace cdrom_sleep() with msleep() and remove
cdrom_sleep() definition.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/ide/ide-cd.c	2004-06-16 05:19:22.000000000 +0000
+++ linux-dev/drivers/ide/ide-cd.c	2004-07-02 17:56:23.000000000 +0000
@@ -1527,19 +1527,6 @@ static ide_startstop_t cdrom_do_packet_c
 }
 
 
-/* Sleep for TIME jiffies.
-   Not to be called from an interrupt handler. */
-static
-void cdrom_sleep (int time)
-{
-	int sleep = time;
-
-	do {
-		set_current_state(TASK_INTERRUPTIBLE);
-		sleep = schedule_timeout(sleep);
-	} while (sleep);
-}
-
 static
 int cdrom_queue_packet_command(ide_drive_t *drive, struct request *rq)
 {
@@ -1574,7 +1561,7 @@ int cdrom_queue_packet_command(ide_drive
 				/* The drive is in the process of loading
 				   a disk.  Retry, but wait a little to give
 				   the drive time to complete the load. */
-				cdrom_sleep(2 * HZ);
+				msleep(2000);
 			} else {
 				/* Otherwise, don't retry. */
 				retries = 0;

--===============6886352648981382==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6886352648981382==--
