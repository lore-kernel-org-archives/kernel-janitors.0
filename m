From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 17:01:57 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 4/15] isdn/elsa: replace
Message-Id: <20040917170156.GE1712@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92341089583422931=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============92341089583422931==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch
submitted a few months ago which has not been merged as of
2.6.9-rc1-mm5 / 2.6.9-rc2.

Description: Uses msleep() in place of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/isdn/hisax/elsa.c	2004-09-13 17:16:03.000000000 -0700
+++ 2.6.9-rc2/drivers/isdn/hisax/elsa.c	2004-09-14 13:56:25.000000000 -0700
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

--===============92341089583422931==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92341089583422931==--
