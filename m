From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 26 Jul 2004 17:56:15 +0000
Subject: [Kernel-janitors] [PATCH] dvb/ves1x93: replace schedule_timeout()
Message-Id: <20040726175615.GV1897@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============80693719997564761=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040726174845.GP1897@us.ibm.com>
In-Reply-To: <20040726174845.GP1897@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============80693719997564761==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish

Applys-to: 2.6.7

Description: Replace dvb_delay() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/media/dvb/ttpci/budget-ci.c	2004-06-16 05:18:58.000000000 +0000
+++ linux-dev/drivers/media/dvb/ttpci/budget-ci.c	2004-07-02 20:28:59.000000000 +0000
@@ -326,7 +326,7 @@ static int ciintf_slot_reset(struct dvb_
 	saa7146_setgpio(saa, 0, SAA7146_GPIO_IRQHI);
 	budget_ci->slot_status = SLOTSTATUS_RESET;
 	budget_debiwrite(budget_ci, DEBICICTL, DEBIADDR_CICONTROL, 1, 0);
-	dvb_delay(1);
+	msleep(1);
 	budget_debiwrite(budget_ci, DEBICICTL, DEBIADDR_CICONTROL, 1, CICONTROL_RESET);
 
 	saa7146_setgpio(saa, 1, SAA7146_GPIO_OUTHI);
@@ -475,7 +475,7 @@ static void ciintf_deinit(struct budget_
 	saa7146_setgpio(saa, 0, SAA7146_GPIO_INPUT);
 	tasklet_kill(&budget_ci->ciintf_irq_tasklet);
 	budget_debiwrite(budget_ci, DEBICICTL, DEBIADDR_CICONTROL, 1, 0);
-	dvb_delay(1);
+	msleep(1);
 	budget_debiwrite(budget_ci, DEBICICTL, DEBIADDR_CICONTROL, 1, CICONTROL_RESET);
 
 	// disable TS data stream to CI interface

--===============80693719997564761==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============80693719997564761==--
