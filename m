From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 22 Sep 2004 21:09:26 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 5/38] net/cosa: replace
Message-Id: <20040922210926.GD1924@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14898737767274417=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============14898737767274417==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. Two patches have been removed from my
set, so the total has been reduced to 38.

Description: Use msleep_interruptible() instead of schedule_timeout()
to guarantee the task delays as expected. Also use set_current_state()
instaed of direct assignment of current->state.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/net/wan/cosa.c	2004-09-13 17:15:42.000000000 -0700
+++ 2.6.9-rc2/drivers/net/wan/cosa.c	2004-09-15 09:39:36.000000000 -0700
@@ -543,7 +543,7 @@ static int cosa_probe(int base, int irq,
 		 * FIXME: When this code is not used as module, we should
 		 * probably call udelay() instead of the interruptible sleep.
 		 */
-		current->state = TASK_INTERRUPTIBLE;
+		set_current_state(TASK_INTERRUPTIBLE);
 		cosa_putstatus(cosa, SR_TX_INT_ENA);
 		schedule_timeout(30);
 		irq = probe_irq_off(irqs);
@@ -1564,8 +1564,7 @@ static int cosa_reset_and_read_id(struct
 	cosa_getdata8(cosa);
 	cosa_putstatus(cosa, SR_RST);
 #ifdef MODULE
-	current->state = TASK_INTERRUPTIBLE;
-	schedule_timeout(HZ/2);
+	msleep_interruptible(500);
 #else
 	udelay(5*100000);
 #endif
@@ -1618,7 +1617,7 @@ static int get_wait_data(struct cosa_dat
 			return r;
 		}
 		/* sleep if not ready to read */
-		current->state = TASK_INTERRUPTIBLE;
+		set_current_state(TASK_INTERRUPTIBLE);
 		schedule_timeout(1);
 	}
 	printk(KERN_INFO "cosa: timeout in get_wait_data (status 0x%x)\n",
@@ -1645,7 +1644,7 @@ static int put_wait_data(struct cosa_dat
 		}
 #if 0
 		/* sleep if not ready to read */
-		current->state = TASK_INTERRUPTIBLE;
+		set_current_state(TASK_INTERRUPTIBLE);
 		schedule_timeout(1);
 #endif
 	}

--===============14898737767274417==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14898737767274417==--
