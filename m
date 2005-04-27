From: "=?iso-8859-1?Q?david.chosrova@libertysurf.fr?="
Date: Wed, 27 Apr 2005 19:52:23 +0000
Subject: [KJ] cli()/sti()-removal
Message-Id: <IFMF7B$A1BC6FE6642552690BEA67D5E7D8ABF3@tiscali.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

=20
=20
--- linux-2.6.11.7/drivers/net/irda/ep7211_ir.c.orig	2005-04-27 17:41:36.00=
0000000 +0100=20
+++ linux-2.6.11.7/drivers/net/irda/ep7211_ir.c	2005-04-27 17:53:33.0000000=
00 +0100=20
@@ -14,6 +14,7 @@=20
=20
 #include <asm/io.h>=20
 #include <asm/hardware.h>=20
+#include<asm/spinlock.h>=20
=20
 #define MIN_DELAY 25      /* 15 us, but wait a little more to be sure */=20
 #define MAX_DELAY 10000   /* 1 ms */=20
@@ -22,7 +23,7 @@ static void ep7211_ir_open(dongle_t *sel=20
 static void ep7211_ir_close(dongle_t *self);=20
 static int  ep7211_ir_change_speed(struct irda_task *task);=20
 static int  ep7211_ir_reset(struct irda_task *task);=20
-=20
+static spinlock_t driver_lock =3D SPIN_LOCK_UNLOCKED;=20
 static struct dongle_reg dongle =3D {=20
 	.type =3D IRDA_EP7211_IR,=20
 	.open =3D ep7211_ir_open,=20
@@ -35,8 +36,8 @@ static struct dongle_reg dongle =3D {=20
 static void ep7211_ir_open(dongle_t *self, struct qos_info *qos)=20
 {=20
 	unsigned int syscon1, flags;=20
-=20
-	save_flags(flags); cli();=20
+=20
+	spin_lock_irqsave(&driver_lock,flags);=20
=20
 	/* Turn on the SIR encoder. */=20
 	syscon1 =3D clps_readl(SYSCON1);=20
@@ -46,14 +47,14 @@ static void ep7211_ir_open(dongle_t *sel=20
 	/* XXX: We should disable modem status interrupts on the first=20
 		UART (interrupt #14). */=20
=20
-	restore_flags(flags);=20
+	spin_unlock_irqrestore(&driver_lock,flags);=20
 }=20
=20
 static void ep7211_ir_close(dongle_t *self)=20
 {=20
 	unsigned int syscon1, flags;=20
=20
-	save_flags(flags); cli();=20
+	spin_lock_irqsave(&driver_lock,flags);=20
=20
 	/* Turn off the SIR encoder. */=20
 	syscon1 =3D clps_readl(SYSCON1);=20
@@ -63,7 +64,7 @@ static void ep7211_ir_close(dongle_t *se=20
 	/* XXX: If we've disabled the modem status interrupts, we should=20
 		reset them back to their original state. */=20
=20
-	restore_flags(flags);=20
+	spin_unlock_irqrestore(&driver_lock,flags);=20
 }=20
=20
 /*=20
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
