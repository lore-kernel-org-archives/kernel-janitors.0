From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 18:36:44 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 16/16] scsi/wd7000: replace
Message-Id: <20040927183644.GE1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46049336406382313=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040917180358.GQ1712@us.ibm.com>
In-Reply-To: <20040917180358.GQ1712@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============46049336406382313==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

--- 2.6.9-rc2-vanilla/drivers/scsi/wd7000.c	2004-09-13 17:16:01.000000000 -0700
+++ 2.6.9-rc2/drivers/scsi/wd7000.c	2004-09-14 09:20:37.000000000 -0700
@@ -1473,8 +1473,7 @@ static int wd7000_detect(struct scsi_hos
 			 * ASC reset...
 			 */
 			outb(ASC_RES, iobase + ASC_CONTROL);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ / 100);
+			msleep(10);
 			outb(0, iobase + ASC_CONTROL);
 
 			if (WAIT(iobase + ASC_STAT, ASC_STATMASK, CMD_RDY, 0)) {

--===============46049336406382313==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46049336406382313==--
