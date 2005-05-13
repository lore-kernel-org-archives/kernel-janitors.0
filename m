From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 13 May 2005 07:44:47 +0000
Subject: [KJ] [PATCH] typo patch on v850e_uart.c
Message-Id: <20050513074447.GB3365@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="bp/iNruPH9dso1Pn"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
Little patch on typo problem.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="typo-serial-v850e_uart.patch"

diff -urpNX dontdiff a/drivers/serial/v850e_uart.c b/drivers/serial/v850e_uart.c
--- a/drivers/serial/v850e_uart.c	2005-05-07 07:20:31.000000000 +0200
+++ b/drivers/serial/v850e_uart.c	2005-05-13 09:40:26.611322136 +0200
@@ -49,7 +49,6 @@
 
 #define V850E_UART_MINOR_BASE	64	   /* First tty minor number */
 
-
 /* Low-level UART functions.  */
 
 /* Configure and turn on uart channel CHAN, using the termios `control

--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--bp/iNruPH9dso1Pn--
