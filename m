From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 23 Jul 2004 20:40:32 +0000
Subject: [Kernel-janitors] [PATCH] isdn/hisax: replace schedule_timeout()
Message-Id: <20040723204032.GC2675@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70338518177820675=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============70338518177820675==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

Thanks,
Nish



Applys-to: 2.6.7

Description: Replace schedule_timeout() with msleep() to guarantee the
task delays the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/isdn/hisax/config.c	2004-06-16 05:19:52.000000000 +0000
+++ linux-dev/drivers/isdn/hisax/config.c	2004-07-02 18:13:46.000000000 +0000
@@ -849,9 +849,8 @@ static int init_card(struct IsdnCardStat
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

--===============70338518177820675==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70338518177820675==--
