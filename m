From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 20:42:11 +0000
Subject: [Kernel-janitors] [PATCH] isdn/hfc_pci: replace schedule_timeout()
Message-Id: <20040723204211.GE2675@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70532847314761193=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============70532847314761193==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/isdn/hisax/hfc_pci.c	2004-06-16 05:19:22.000000000 +0000
+++ linux-dev/drivers/isdn/hisax/hfc_pci.c	2004-07-02 18:14:28.000000000 +0000
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

--===============70532847314761193==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70532847314761193==--
