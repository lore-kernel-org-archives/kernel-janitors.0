From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 18:23:03 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 8/16] scsi/ppa: replace
Message-Id: <20040927182303.GW1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57811338406387547=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============57811338406387547==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

--- 2.6.9-rc2-vanilla/drivers/scsi/ppa.c	2004-09-13 17:16:00.000000000 -0700
+++ 2.6.9-rc2/drivers/scsi/ppa.c	2004-09-14 09:13:35.000000000 -0700
@@ -1034,7 +1034,7 @@ static int __ppa_attach(struct parport *
 	dev->waiting = &waiting;
 	prepare_to_wait(&waiting, &wait, TASK_UNINTERRUPTIBLE);
 	if (ppa_pb_claim(dev))
-		schedule_timeout(3 * HZ);
+		msleep(3000);
 	if (dev->wanted) {
 		printk(KERN_ERR "ppa%d: failed to claim parport because "
 				"a pardevice is owning the port for too long "

--===============57811338406387547==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57811338406387547==--
