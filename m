From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 20:41:43 +0000
Subject: [Kernel-janitors] [PATCH] isdn/elsa: replace schedule_timeout()
Message-Id: <20040723204143.GD2675@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============047172769393095448=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============047172769393095448==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/isdn/hisax/elsa.c	2004-06-16 05:18:59.000000000 +0000
+++ linux-dev/drivers/isdn/hisax/elsa.c	2004-07-02 18:14:11.000000000 +0000
@@ -691,8 +691,7 @@ Elsa_card_msg(struct IsdnCardState *cs, 
 				byteout(cs->hw.elsa.ctrl, cs->hw.elsa.ctrl_reg);
 				byteout(cs->hw.elsa.timer, 0);
 				spin_unlock_irqrestore(&cs->lock, flags);
-				set_current_state(TASK_UNINTERRUPTIBLE);
-				schedule_timeout((110*HZ)/1000);
+				msleep(110);
 				spin_lock_irqsave(&cs->lock, flags);
 				cs->hw.elsa.ctrl_reg &= ~ELSA_ENA_TIMER_INT;
 				byteout(cs->hw.elsa.ctrl, cs->hw.elsa.ctrl_reg);

--===============047172769393095448==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============047172769393095448==--
