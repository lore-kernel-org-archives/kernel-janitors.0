From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 01 Sep 2004 22:53:38 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc1-bk7] pcmcia/yenta_socket:
Message-Id: <20040901225338.GI2516@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53321103931356717=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040901222224.GD2516@us.ibm.com>
In-Reply-To: <20040901222224.GD2516@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============53321103931356717==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This is one of 10 patches which have either not been pushed to mainline
(2.6.9-rc1-bk7) or have not been included in any of the recent kjt's.

Applys-to: 2.6.9-rc1-bk7

Description: Uses msleep() instead of schedule_timeout() to guarantee
the task delays as desired.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.9-rc1-bk7-vanilla/drivers/pcmcia/yenta_socket.c	2004-08-31 21:59:37.000000000 +0000
+++ 2.6.9-rc1-bk7-dev/drivers/pcmcia/yenta_socket.c	2004-09-01 21:40:21.000000000 +0000
@@ -827,8 +827,7 @@ static int yenta_probe_cb_irq(struct yen
 	cb_writel(socket, CB_SOCKET_MASK, CB_CSTSMASK);
 	cb_writel(socket, CB_SOCKET_FORCE, CB_FCARDSTS);
 	
-	set_current_state(TASK_UNINTERRUPTIBLE);
-	schedule_timeout(HZ/10);
+	msleep(100);
 
 	/* disable interrupts */
 	cb_writel(socket, CB_SOCKET_MASK, 0);

--===============53321103931356717==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53321103931356717==--
