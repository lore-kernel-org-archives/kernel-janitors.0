From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 27 Jul 2004 22:05:37 +0000
Subject: [Kernel-janitors] [PATCH] pcmcia/yenta_socket: replace
Message-Id: <20040727220537.GB3471@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1132284864364963=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============1132284864364963==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Use msleep() instead of schedule_timeout() to 
guarantee the task delays for the desired time.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/pcmcia/yenta_socket.c	2004-06-16 05:19:36.000000000 +0000
+++ linux-dev/drivers/pcmcia/yenta_socket.c	2004-07-03 02:48:00.000000000 +0000
@@ -818,8 +818,7 @@ static int yenta_probe_cb_irq(struct yen
 	cb_writel(socket, CB_SOCKET_MASK, CB_CSTSMASK);
 	cb_writel(socket, CB_SOCKET_FORCE, CB_FCARDSTS);
 	
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ/10);
+	msleep(100);
 
 	/* disable interrupts */
 	cb_writel(socket, CB_SOCKET_MASK, 0);

--===============1132284864364963==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1132284864364963==--
