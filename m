From: Christophe Lucas <clucas@rotomalug.org>
Date: Mon, 09 May 2005 10:18:29 +0000
Subject: [KJ] [PATCH] min/max : drivers/sbus/char/aurora.c
Message-Id: <20050509101829.GL4777@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="4Ckj6UjgE2iN1+kY"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

description :
min/max macros from kernel.h are safe, a lot of handcrafted MIN/MAX are
not.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="remove-MIN-macro-aurora.patch"

diff -urpNX dontdiff a/drivers/sbus/char/aurora.c b/drivers/sbus/char/aurora.c
--- a/drivers/sbus/char/aurora.c	2005-05-07 07:20:31.000000000 +0200
+++ b/drivers/sbus/char/aurora.c	2005-05-09 12:10:18.022352928 +0200
@@ -81,10 +81,6 @@ unsigned char irqs[4] = {
 int irqhit=0;
 #endif
 
-#ifndef MIN
-#define MIN(a,b) ((a) < (b) ? (a) : (b))
-#endif
-
 static struct tty_driver *aurora_driver;
 static struct Aurora_board aurora_board[AURORA_NBOARD] = {
 	{0,},
@@ -594,7 +590,7 @@ static void aurora_transmit(struct Auror
 					    &bp->r[chip]->r[CD180_TDR]);
 				port->COR2 &= ~COR2_ETC;
 			}
-			count = MIN(port->break_length, 0xff);
+			count = min(port->break_length, 0xff);
 			sbus_writeb(CD180_C_ESC,
 				    &bp->r[chip]->r[CD180_TDR]);
 			sbus_writeb(CD180_C_DELAY,
@@ -1575,7 +1571,7 @@ static int aurora_write(struct tty_struc
 	save_flags(flags);
 	while (1) {
 		cli();
-		c = MIN(count, MIN(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
+		c = min(count, min(SERIAL_XMIT_SIZE - port->xmit_cnt - 1,
 				   SERIAL_XMIT_SIZE - port->xmit_head));
 		if (c <= 0) {
 			restore_flags(flags);

--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--4Ckj6UjgE2iN1+kY--
