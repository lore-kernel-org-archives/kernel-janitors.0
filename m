From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 23 Sep 2004 22:14:00 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 25/38] net/ni65: replace
Message-Id: <20040923221400.GJ13244@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46799330103554482=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============46799330103554482==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/ni65.c	2004-09-13 17:15:44.000000000 -0700
+++ 2.6.9-rc2/drivers/net/ni65.c	2004-09-14 17:23:28.000000000 -0700
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

--===============46799330103554482==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46799330103554482==--
