From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 16:53:39 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 3/15] isdn/config: replace
Message-Id: <20040917165339.GD1712@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76381515766619179=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============76381515766619179==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch
submitted a few months ago which has not been merged as of
2.6.9-rc1-mm5 / 2.6.9-rc2.

Description: Uses msleep() in place of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/isdn/hisax/config.c	2004-09-13 17:16:03.000000000 -0700
+++ 2.6.9-rc2/drivers/isdn/hisax/config.c	2004-09-14 13:55:43.000000000 -0700
@@ -843,9 +843,8 @@ static int init_card(struct IsdnCardStat
 	}
 	while (cnt) {
 		cs->cardmsg(cs, CARD_INIT, NULL);
-		set_current_state(TASK_UNINTERRUPTIBLE);
 		/* Timeout 10ms */
-		schedule_timeout((10 * HZ) / 1000);
+		msleep(10);
 		printk(KERN_INFO "%s: IRQ %d count %d\n",
 		       CardType[cs->typ], cs->irq, kstat_irqs(cs->irq));
 		if (kstat_irqs(cs->irq) == irq_cnt) {

--===============76381515766619179==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76381515766619179==--
