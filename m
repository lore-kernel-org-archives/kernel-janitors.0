From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 22:04:42 +0000
Subject: [Kernel-janitors] [PATCH] pcmcia/sa1100_h3600: replace
Message-Id: <20040727220442.GA3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87242104869281745=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============87242104869281745==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to 
guarantee the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/pcmcia/sa1100_h3600.c	2004-06-16 05:19:43.000000000 +0000
+++ linux-dev/drivers/pcmcia/sa1100_h3600.c	2004-07-03 02:47:50.000000000 +0000
@@ -96,8 +96,7 @@ static void h3600_pcmcia_socket_init(str
 	set_h3600_egpio(IPAQ_EGPIO_OPT_ON);
 	clr_h3600_egpio(IPAQ_EGPIO_OPT_RESET);
 
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(10*HZ / 1000);
+	msleep(10);
 
 	soc_pcmcia_enable_irqs(skt, irqs, ARRAY_SIZE(irqs));
 }

--===============87242104869281745==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87242104869281745==--
