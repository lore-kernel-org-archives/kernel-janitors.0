From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 16 Sep 2004 23:11:14 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 1/3] ide/ide-cd: replace
Message-Id: <20040916231114.GE1777@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49154365171629522=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============49154365171629522==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Uses msleep() in place of cdrom_sleep()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/ide/ide-cd.c	2004-09-13 17:16:06.000000000 -0700
+++ 2.6.9-rc2/drivers/ide/ide-cd.c	2004-09-14 13:52:14.000000000 -0700
@@ -1519,19 +1519,6 @@ static ide_startstop_t cdrom_do_packet_c
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
@@ -1566,7 +1553,7 @@ int cdrom_queue_packet_command(ide_drive
 				/* The drive is in the process of loading
 				   a disk.  Retry, but wait a little to give
 				   the drive time to complete the load. */
-				cdrom_sleep(2 * HZ);
+				msleep(2000);
 			} else {
 				/* Otherwise, don't retry. */
 				retries = 0;

--===============49154365171629522==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49154365171629522==--
