From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 22:04:06 +0000
Subject: [Kernel-janitors] [PATCH] pcmcia/i82365: replace schedule_timeout()
Message-Id: <20040727220406.GZ3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61688884825813672=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============61688884825813672==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to 
guarantee the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/pcmcia/i82365.c	2004-06-16 05:19:53.000000000 +0000
+++ linux-dev/drivers/pcmcia/i82365.c	2004-07-03 02:47:41.000000000 +0000
@@ -514,8 +514,7 @@ static u_int __init test_irq(u_short soc
     if (request_irq(irq, i365_count_irq, 0, "scan", i365_count_irq) != 0)
 	return 1;
     irq_hits = 0; irq_sock = sock;
-    __set_current_state(TASK_UNINTERRUPTIBLE);
-    schedule_timeout(HZ/100);
+    msleep(10);
     if (irq_hits) {
 	free_irq(irq, i365_count_irq);
 	debug(2, "    spurious hit!\n");

--===============61688884825813672==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61688884825813672==--
