From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 17:11:01 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 7/15] isdn/hfc_pci: replace
Message-Id: <20040917171101.GH1712@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63512715065852099=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============63512715065852099==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch
submitted a few months ago which has not been merged as of
2.6.9-rc1-mm5 / 2.6.9-rc2.

Description: Use msleep() instead of schedule_timeout() to guarantee the
task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/isdn/hisax/hfc_pci.c	2004-09-13 17:16:03.000000000 -0700
+++ 2.6.9-rc2/drivers/isdn/hisax/hfc_pci.c	2004-09-14 13:57:09.000000000 -0700
@@ -1619,8 +1619,7 @@ hfcpci_card_msg(struct IsdnCardState *cs
 			inithfcpci(cs);
 			reset_hfcpci(cs);
 			spin_unlock_irqrestore(&cs->lock, flags);
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			schedule_timeout((80 * HZ) / 1000);	/* Timeout 80ms */
+			msleep(80);				/* Timeout 80ms */
 			/* now switch timer interrupt off */
 			spin_lock_irqsave(&cs->lock, flags);
 			cs->hw.hfcpci.int_m1 &= ~HFCPCI_INTS_TIMER;

--===============63512715065852099==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63512715065852099==--
