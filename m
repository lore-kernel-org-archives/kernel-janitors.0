From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 16:48:34 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 3/5] pcmcia/i82365: replace
Message-Id: <20040927164834.GE1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29830059046892288=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============29830059046892288==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/pcmcia/i82365.c	2004-09-13 17:16:07.000000000 -0700
+++ 2.6.9-rc2/drivers/pcmcia/i82365.c	2004-09-15 10:01:27.000000000 -0700
@@ -513,8 +513,7 @@ static u_int __init test_irq(u_short soc
     if (request_irq(irq, i365_count_irq, 0, "scan", i365_count_irq) != 0)
 	return 1;
     irq_hits = 0; irq_sock = sock;
-    __set_current_state(TASK_UNINTERRUPTIBLE);
-    schedule_timeout(HZ/100);
+    msleep(10);
     if (irq_hits) {
 	free_irq(irq, i365_count_irq);
 	debug(2, "    spurious hit!\n");

--===============29830059046892288==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29830059046892288==--
