From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 22:34:30 +0000
Subject: [Kernel-janitors] [PATCH] scsi/eata_pio: replace schedule_timeout()
Message-Id: <20040727223430.GK3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6776712919424861=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============6776712919424861==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to 
guarantee the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/scsi/eata_pio.c	2004-06-16 05:19:37.000000000 +0000
+++ linux-dev/drivers/scsi/eata_pio.c	2004-07-03 03:47:44.000000000 +0000
@@ -508,8 +508,7 @@ static int eata_pio_host_reset(Scsi_Cmnd
 	HD(cmd)->state = RESET;
 
 	spin_unlock_irq(host->host_lock);
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(3 * HZ);
+	msleep(3000);
 	spin_lock_irq(host->host_lock);
 
 	DBG(DBG_ABNORM, printk(KERN_WARNING "eata_pio_reset: interrupts disabled, " "loops %d.\n", limit));

--===============6776712919424861==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6776712919424861==--
