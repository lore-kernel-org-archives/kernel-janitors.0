From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 22:53:00 +0000
Subject: [Kernel-janitors] [PATCH] scsi/sata_promise: replace
Message-Id: <20040727225300.GB4679@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============37997212789516355=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============37997212789516355==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to 
guarantee the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/scsi/sata_promise.c	2004-06-16 05:19:43.000000000 +0000
+++ linux-dev/drivers/scsi/sata_promise.c	2004-07-03 03:58:43.000000000 +0000
@@ -518,8 +518,7 @@ static void pdc_host_init(unsigned int c
 	writel(tmp, mmio + PDC_TBG_MODE);
 
 	readl(mmio + PDC_TBG_MODE);	/* flush */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(msecs_to_jiffies(10) + 1);
+	msleep(10);
 
 	/* adjust slew rate control register. */
 	tmp = readl(mmio + PDC_SLEW_CTL);

--===============37997212789516355==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============37997212789516355==--
