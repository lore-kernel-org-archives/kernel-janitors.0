From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 22:08:44 +0000
Subject: [Kernel-janitors] [PATCH] s390/device_ops: insert
Message-Id: <20040727220844.GC3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99671617694595782=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============99671617694595782==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Add appropriate set_current_state() calls so
schedule_timeout() functions as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/s390/cio/device_ops.c	2004-06-16 05:19:43.000000000 +0000
+++ linux-dev/drivers/s390/cio/device_ops.c	2004-07-14 16:29:23.000000000 +0000
@@ -268,6 +268,7 @@ __ccw_device_retry_loop(struct ccw_devic
 		if ((ret == -EBUSY) || (ret == -EACCES)) {
 			/* Try again later. */
 			spin_unlock_irq(&sch->lock);
+			set_current_state(TASK_UNINTERRUPTIBLE);
 			schedule_timeout(1);
 			spin_lock_irq(&sch->lock);
 			continue;
@@ -294,6 +295,7 @@ __ccw_device_retry_loop(struct ccw_devic
 			break;
 		/* Try again later. */
 		spin_unlock_irq(&sch->lock);
+		set_current_state(TASK_UINTERRUPTIBLE);
 		schedule_timeout(1);
 		spin_lock_irq(&sch->lock);
 	} while (1);

--===============99671617694595782==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99671617694595782==--
