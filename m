From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 20:43:08 +0000
Subject: [Kernel-janitors] [PATCH] isdn/hfcscard: replace schedule_timeout()
Message-Id: <20040723204308.GG2675@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39777023500763531=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============39777023500763531==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/isdn/hisax/hfcscard.c	2004-06-16 05:20:04.000000000 +0000
+++ linux-dev/drivers/isdn/hisax/hfcscard.c	2004-07-02 18:15:51.000000000 +0000
@@ -125,8 +125,7 @@ hfcs_card_msg(struct IsdnCardState *cs, 
 			init2bds0(cs);
 			spin_unlock_irqrestore(&cs->lock, flags);
 			delay = (80*HZ)/1000 +1;
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout((80*HZ)/1000);
+			msleep(80);
 			spin_lock_irqsave(&cs->lock, flags);
 			cs->hw.hfcD.ctmt |= HFCD_TIM800;
 			cs->BC_Write_Reg(cs, HFCD_DATA, HFCD_CTMT, cs->hw.hfcD.ctmt); 

--===============39777023500763531==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39777023500763531==--
