From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 17:11:57 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 8/15] isdn/hfc_sx: replace
Message-Id: <20040917171157.GI1712@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66998417226439466=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============66998417226439466==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch
submitted a few months ago which has not been merged as of
2.6.9-rc1-mm5 / 2.6.9-rc2.

Description: Use msleep() instead of schedule_timeout() to guarantee the
task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/isdn/hisax/hfc_sx.c	2004-09-13 17:16:03.000000000 -0700
+++ 2.6.9-rc2/drivers/isdn/hisax/hfc_sx.c	2004-09-14 13:58:13.000000000 -0700
@@ -314,8 +314,7 @@ release_io_hfcsx(struct IsdnCardState *c
 	cs->hw.hfcsx.int_m2 = 0;	/* interrupt output off ! */
 	Write_hfc(cs, HFCSX_INT_M2, cs->hw.hfcsx.int_m2);
 	Write_hfc(cs, HFCSX_CIRM, HFCSX_RESET);	/* Reset On */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout((30 * HZ) / 1000);	/* Timeout 30ms */
+	msleep(30);				/* Timeout 30ms */
 	Write_hfc(cs, HFCSX_CIRM, 0);	/* Reset Off */
 	del_timer(&cs->hw.hfcsx.timer);
 	release_region(cs->hw.hfcsx.base, 2); /* release IO-Block */
@@ -1367,8 +1366,7 @@ hfcsx_card_msg(struct IsdnCardState *cs,
 			spin_lock_irqsave(&cs->lock, flags);
 			inithfcsx(cs);
 			spin_unlock_irqrestore(&cs->lock, flags);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout((80 * HZ) / 1000);	/* Timeout 80ms */
+			msleep(80);				/* Timeout 80ms */
 			/* now switch timer interrupt off */
 			spin_lock_irqsave(&cs->lock, flags);
 			cs->hw.hfcsx.int_m1 &= ~HFCSX_INTS_TIMER;

--===============66998417226439466==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66998417226439466==--
