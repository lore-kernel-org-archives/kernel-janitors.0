From: acripps <acripps@gmail.com>
Date: Sat, 09 Jun 2007 03:01:35 +0000
Subject: [KJ] [PATCH 1.5/4] 2.6 drivers/net sctisys-sir clean up whitespace
Message-Id: <20070609031335.14624.25357.sendpatchset@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

this patch is just a bit of a treat ... this removes the unneccesary whites=
pace from
before newline characters ... this is purely cosmetic.
Signed-off-by: Aaron Cripps <cripps@cs.mun.ca>


diff --git a/drivers/net/irda/actisys-sir.c b/drivers/net/irda/actisys-sir.c
index 9715ab5..8cacf74 100644
--- a/drivers/net/irda/actisys-sir.c
+++ b/drivers/net/irda/actisys-sir.c
@@ -1,8 +1,8 @@
 /*********************************************************************
- *               =20
+ *
  * Filename:      actisys.c
  * Version:       1.1
- * Description:   Implementation for the ACTiSYS IR-220L and IR-220L+=20
+ * Description:   Implementation for the ACTiSYS IR-220L and IR-220L+
  *                dongles
  * Status:        Beta.
  * Authors:       Dag Brattli <dagb@cs.uit.no> (initially)
@@ -11,20 +11,20 @@
  * Created at:    Wed Oct 21 20:02:35 1998
  * Modified at:   Sun Oct 27 22:02:13 2002
  * Modified by:   Martin Diehl <mad@mdiehl.de>
- *=20
+ *
  *     Copyright (c) 1998-1999 Dag Brattli, All Rights Reserved.
  *     Copyright (c) 1999 Jean Tourrilhes
  *     Copyright (c) 2002 Martin Diehl
- *     =20
- *     This program is free software; you can redistribute it and/or=20
- *     modify it under the terms of the GNU General Public License as=20
- *     published by the Free Software Foundation; either version 2 of=20
+ *
+ *     This program is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of
  *     the License, or (at your option) any later version.
- * =20
+ *
  *     Neither Dag Brattli nor University of Troms=F8 admit liability nor
- *     provide warranty for any of this software. This material is=20
+ *     provide warranty for any of this software. This material is
  *     provided "AS-IS" and at no charge.
- *    =20
+ *
  ********************************************************************/
=20
 /*
@@ -48,7 +48,7 @@
=20
 #include "sir-dev.h"
=20
-/*=20
+/*
  * Define the timing of the pulses we send to the dongle (to reset it, and
  * to toggle speeds). Basically, the limit here is the propagation speed of
  * the signals through the serial port, the dongle being much faster.  Any
@@ -172,9 +172,9 @@ static int actisys_change_speed(struct sir_dev *dev, un=
signed speed)
 	 * we are in known state (dongle default)
 	 */
=20
-	/*=20
+	/*
 	 * Now, we can set the speed requested. Send RTS pulses until we
-         * reach the target speed=20
+         * reach the target speed
 	 */
 	for (i =3D 0; i < MAX_SPEEDS; i++) {
 		if (speed =3D baud_rates[i]) {
@@ -230,14 +230,14 @@ static int actisys_reset(struct sir_dev *dev)
=20
 	/* Go back to normal mode */
 	sirdev_set_dtr_rts(dev, TRUE, TRUE);
-=09
+
 	dev->speed =3D 9600;	/* That's the default */
=20
 	return 0;
 }
=20
 MODULE_AUTHOR("Dag Brattli <dagb@cs.uit.no> - Jean Tourrilhes <jt@hpl.hp.c=
om>");
-MODULE_DESCRIPTION("ACTiSYS IR-220L and IR-220L+ dongle driver");=09
+MODULE_DESCRIPTION("ACTiSYS IR-220L and IR-220L+ dongle driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("irda-dongle-2"); /* IRDA_ACTISYS_DONGLE */
 MODULE_ALIAS("irda-dongle-3"); /* IRDA_ACTISYS_PLUS_DONGLE */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
