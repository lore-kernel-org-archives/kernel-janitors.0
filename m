From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 24 Sep 2004 23:06:20 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 2/3] parport/ieee1284_ops:
Message-Id: <20040924230620.GA1757@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============088079854769220756=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040916234448.GH1777@us.ibm.com>
In-Reply-To: <20040916234448.GH1777@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============088079854769220756==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep_interruptible() instead of schedule_timeout() to
guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/parport/ieee1284_ops.c	2004-09-13 17:16:02.000000000 -0700
+++ 2.6.9-rc2/drivers/parport/ieee1284_ops.c	2004-09-15 09:56:26.000000000 -0700
@@ -97,8 +97,7 @@ size_t parport_ieee1284_write_compat (st
                            our interrupt handler called. */
 			if (count && no_irq) {
 				parport_release (dev);
-				__set_current_state (TASK_INTERRUPTIBLE);
-				schedule_timeout (wait);
+				msleep_interruptible(jiffies_to_msecs(wait));
 				parport_claim_or_block (dev);
 			}
 			else
@@ -542,8 +541,7 @@ size_t parport_ieee1284_ecp_read_data (s
 			/* Yield the port for a while. */
 			if (count && dev->port->irq != PARPORT_IRQ_NONE) {
 				parport_release (dev);
-				__set_current_state (TASK_INTERRUPTIBLE);
-				schedule_timeout ((HZ + 24) / 25);
+				msleep_interruptible(40);
 				parport_claim_or_block (dev);
 			}
 			else

--===============088079854769220756==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============088079854769220756==--
