From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 22 Jul 2004 22:11:50 +0000
Subject: [Kernel-janitors] [PATCH] i2c-keywest: replace schedule_timeout()
Message-Id: <20040722221150.GN2165@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============25883177473247665=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============25883177473247665==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish



Applys-to: 2.6.7

Description: Remove iic_ite_sleep() and replace invocations with msleep().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/i2c/busses/i2c-keywest.c	2004-06-16 05:19:42.000000000 +0000
+++ linux-dev/drivers/i2c/busses/i2c-keywest.c	2004-07-02 17:54:11.000000000 +0000
@@ -662,8 +662,7 @@ dispose_iface(struct device *dev)
 	spin_lock_irq(&iface->lock);
 	while (iface->state != state_idle) {
 		spin_unlock_irq(&iface->lock);
-		set_task_state(current,TASK_UNINTERRUPTIBLE);
-		schedule_timeout(HZ/10);
+		msleep(100);		/* sleep 100ms */
 		spin_lock_irq(&iface->lock);
 	}
 #endif /* POLLED_MODE */

--===============25883177473247665==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============25883177473247665==--
