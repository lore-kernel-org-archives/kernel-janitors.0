From: "=?iso-8859-1?Q?david.chosrova@libertysurf.fr?="
Date: Sat, 30 Apr 2005 14:57:17 +0000
Subject: [KJ] sti()/cli()-removal, ep7211.c
Message-Id: <IFRLJH$317A86FD484B7EFA68D727459475A8C1@tiscali.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Thank you for the comments ( Domen, francois, Randy).


 --- linux-2.6.11.7/drivers/net/irda/ep7211_ir.c.orig
2005-04-27 17:41:36.000000000 +0100
+++ linux-2.6.11.7/drivers/net/irda/ep7211_ir.c	2005-04-30
13:44:03.000000000 +0100
@@ -8,12 +8,14 @@
 #include <linux/delay.h>
 #include <linux/tty.h>
 #include <linux/init.h>
+#include <linux/spinlock.h>

 #include <net/irda/irda.h>
 #include <net/irda/irda_device.h>

 #include <asm/io.h>
 #include <asm/hardware.h>
+
=20
 #define MIN_DELAY 25      /* 15 us, but wait a little more
to be sure */
 #define MAX_DELAY 10000   /* 1 ms */
@@ -22,7 +24,7 @@ static void ep7211_ir_open(dongle_t *sel
 static void ep7211_ir_close(dongle_t *self);
 static int  ep7211_ir_change_speed(struct irda_task *task);
 static int  ep7211_ir_reset(struct irda_task *task);
-
+static spinlock_t driver_lock;
 static struct dongle_reg dongle =3D {
 	.type =3D IRDA_EP7211_IR,
 	.open =3D ep7211_ir_open,
@@ -36,7 +38,8 @@ static void ep7211_ir_open(dongle_t *sel
 {
 	unsigned int syscon1, flags;

-	save_flags(flags); cli();
+
+	spin_lock_irqsave(&driver_lock, flags);

 	/* Turn on the SIR encoder. */
 	syscon1 =3D clps_readl(SYSCON1);
@@ -46,14 +49,14 @@ static void ep7211_ir_open(dongle_t *sel
 	/* XXX: We should disable modem status interrupts on the first
 		UART (interrupt #14). */

-	restore_flags(flags);
+	spin_unlock_irqrestore(&driver_lock, flags);
 }

 static void ep7211_ir_close(dongle_t *self)
 {
 	unsigned int syscon1, flags;
=20
-	save_flags(flags); cli();
+	spin_lock_irqsave(&driver_lock, flags);

 	/* Turn off the SIR encoder. */
 	syscon1 =3D clps_readl(SYSCON1);
@@ -63,7 +66,7 @@ static void ep7211_ir_close(dongle_t *se
 	/* XXX: If we've disabled the modem status interrupts, we
should
 		reset them back to their original state. */

-	restore_flags(flags);
+	spin_unlock_irqrestore(&driver_lock, flags);
 }

 /*
@@ -99,6 +102,7 @@ static int ep7211_ir_reset(struct irda_t
  */
 static int __init ep7211_ir_init(void)
 {
+	spin_lock_init(&driver_lock);
 	return irda_device_register_dongle(&dongle);
 }
=20

************************ ADSL JUSQU'A 8 MEGA + 3 MOIS DE TELEPHONE GRATUIT =
************************
L'ultra haut d=E9bit =E0 15EUR/mois seulement ! Et vous t=E9l=E9phonez grat=
uitement en France vers les postes fixes,
hors num=E9ros sp=E9ciaux pendant 3 mois.
Pour profiter de cette offre exceptionnelle, cliquez ici : http://register.=
tiscali.fr/adsl/  (voir conditions sur le site)



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
