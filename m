From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 18:28:34 +0000
Subject: [Kernel-janitors] [PATCH] net/ni65: replace schedule_timeout() with
Message-Id: <20040727182834.GQ2099@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64957287735061131=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============64957287735061131==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/net/ni65.c	2004-06-16 05:19:02.000000000 +0000
+++ linux-dev/drivers/net/ni65.c	2004-07-03 01:28:44.000000000 +0000
@@ -526,8 +526,7 @@ static int __init ni65_probe1(struct net
 			ni65_init_lance(p,dev->dev_addr,0,0);
 			irq_mask = probe_irq_on();
 			writereg(CSR0_INIT|CSR0_INEA,CSR0); /* trigger interrupt */
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout(HZ/50);
+			msleep(20);
 			dev->irq = probe_irq_off(irq_mask);
 			if(!dev->irq)
 			{

--===============64957287735061131==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64957287735061131==--
