From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 22:58:38 +0000
Subject: [Kernel-janitors] [PATCH] scsi/wd7000: replace schedule_timeout()
Message-Id: <20040727225837.GE4679@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2140960848641158=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============2140960848641158==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to 
guarantee the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/scsi/wd7000.c	2004-06-16 05:20:25.000000000 +0000
+++ linux-dev/drivers/scsi/wd7000.c	2004-07-06 00:56:41.000000000 +0000
@@ -1516,8 +1516,7 @@ static int wd7000_detect(Scsi_Host_Templ
 			 * ASC reset...
 			 */
 			outb(ASC_RES, iobase + ASC_CONTROL);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ / 100);
+			msleep(10);
 			outb(0, iobase + ASC_CONTROL);
 
 			if (WAIT(iobase + ASC_STAT, ASC_STATMASK, CMD_RDY, 0)) {

--===============2140960848641158==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2140960848641158==--
