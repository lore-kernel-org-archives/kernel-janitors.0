From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 16:50:56 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 5/5] pcmcia/yenta_socket:
Message-Id: <20040927165056.GG1676@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============97469642785250121=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============97469642785250121==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated.

Description: Use msleep() instead of schedule_timeout()
to guarantee the task delays as expected.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc1-mm4-vanilla/drivers/pcmcia/yenta_socket.c	2004-09-09 23:05:58.000000000 -0700
+++ 2.6.9-rc1-mm4/drivers/pcmcia/yenta_socket.c	2004-09-10 15:35:50.000000000 -0700
@@ -827,8 +827,7 @@ static int yenta_probe_cb_irq(struct yen
 	cb_writel(socket, CB_SOCKET_MASK, CB_CSTSMASK);
 	cb_writel(socket, CB_SOCKET_FORCE, CB_FCARDSTS);
 	
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ/10);
+	msleep(100);
 
 	/* disable interrupts */
 	cb_writel(socket, CB_SOCKET_MASK, 0);

--===============97469642785250121==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============97469642785250121==--
