From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 21:08:52 +0000
Subject: [Kernel-janitors] [PATCH] parport/ieee1284_ops: replace
Message-Id: <20040727210852.GM3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45131255416329008=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040727210821.GL3471@us.ibm.com>
In-Reply-To: <20040727210821.GL3471@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============45131255416329008==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. This is one (of
many) cases where I made a decision about replacing

set_current_state(TASK_INTERRUPTIBLE);
schedule_timeout(some_time);

with

msleep(jiffies_to_msecs(some_time));

msleep() is not exactly the same as the previous code, but I only did
this replacement where I thought long delays were *desired*. If this is
not the case here, then just disregard this patch. 

Thanks,
Nish



Applys-to: 2.6.7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- linux-vanilla/drivers/parport/ieee1284_ops.c	2004-06-16 05:20:04.000000000 +0000
+++ linux-dev/drivers/parport/ieee1284_ops.c	2004-07-12 22:09:23.000000000 +0000
@@ -542,8 +542,7 @@ size_t parport_ieee1284_ecp_read_data (s
 			/* Yield the port for a while. */
 			if (count && dev->port->irq != PARPORT_IRQ_NONE) {
 				parport_release (dev);
-				__set_current_state (TASK_INTERRUPTIBLE);
-				schedule_timeout ((HZ + 24) / 25);
+				msleep(40);
 				parport_claim_or_block (dev);
 			}
 			else

--===============45131255416329008==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45131255416329008==--
