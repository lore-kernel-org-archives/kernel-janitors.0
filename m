From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 17:12:38 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 9/15] isdn/hfcscard: replace
Message-Id: <20040917171238.GJ1712@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14615842730154571=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============14615842730154571==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch
submitted a few months ago which has not been merged as of
2.6.9-rc1-mm5 / 2.6.9-rc2.

Description: Use msleep() instead of schedule_timeout() to guarantee the
task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/isdn/hisax/hfcscard.c	2004-09-13 17:16:03.000000000 -0700
+++ 2.6.9-rc2/drivers/isdn/hisax/hfcscard.c	2004-09-14 13:58:42.000000000 -0700
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

--===============14615842730154571==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14615842730154571==--
