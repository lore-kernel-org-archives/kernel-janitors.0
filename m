From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 20:42:39 +0000
Subject: [Kernel-janitors] [PATCH] isdn/hfc_sx: replace schedule_timeout()
Message-Id: <20040723204239.GF2675@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15982947936635594=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============15982947936635594==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/isdn/hisax/hfc_sx.c	2004-06-16 05:18:57.000000000 +0000
+++ linux-dev/drivers/isdn/hisax/hfc_sx.c	2004-07-02 18:15:37.000000000 +0000
@@ -314,8 +314,7 @@ release_io_hfcsx(struct IsdnCardState *c
 	cs->hw.hfcsx.int_m2 = 0;	/* interrupt output off ! */
 	Write_hfc(cs, HFCSX_INT_M2, cs->hw.hfcsx.int_m2);
 	Write_hfc(cs, HFCSX_CIRM, HFCSX_RESET);	/* Reset On */
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout((30 * HZ) / 1000);	/* Timeout 30ms */
+	msleep(30);
 	Write_hfc(cs, HFCSX_CIRM, 0);	/* Reset Off */
 	del_timer(&cs->hw.hfcsx.timer);
 	release_region(cs->hw.hfcsx.base, 2); /* release IO-Block */
@@ -1367,8 +1366,7 @@ hfcsx_card_msg(struct IsdnCardState *cs,
 			spin_lock_irqsave(&cs->lock, flags);
 			inithfcsx(cs);
 			spin_unlock_irqrestore(&cs->lock, flags);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout((80 * HZ) / 1000);	/* Timeout 80ms */
+			msleep(80);		/* Timeout 80 ms */
 			/* now switch timer interrupt off */
 			spin_lock_irqsave(&cs->lock, flags);
 			cs->hw.hfcsx.int_m1 &= ~HFCSX_INTS_TIMER;

--===============15982947936635594==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15982947936635594==--
