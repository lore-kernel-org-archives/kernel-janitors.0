From: Aaron Cripps <acripps@gmail.com>
Date: Tue, 05 Jun 2007 22:53:52 +0000
Subject: [KJ] Re: [PATCH ARRAY_SIZE 1.5/4] Kernel cleanup in drivers/net
Message-Id: <4665EC50.7070702@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

this patch is just a bit of a treat ... this removes the unneccesary 
whitespace from
before newline characters ... this is purely cosmetic.
Signed-off-by: Aaron Cripps <cripps@cs.mun.ca>


diff --git a/drivers/net/irda/actisys-sir.c b/drivers/net/irda/actisys-sir.c
index 9715ab5..8cacf74 100644
--- a/drivers/net/irda/actisys-sir.c
+++ b/drivers/net/irda/actisys-sir.c
@@ -1,8 +1,8 @@
 /*********************************************************************
- *               
+ *
  * Filename:      actisys.c
  * Version:       1.1
- * Description:   Implementation for the ACTiSYS IR-220L and IR-220L+
+ * Description:   Implementation for the ACTiSYS IR-220L and IR-220L+
  *                dongles
  * Status:        Beta.
  * Authors:       Dag Brattli <dagb@cs.uit.no> (initially)
@@ -11,20 +11,20 @@
  * Created at:    Wed Oct 21 20:02:35 1998
  * Modified at:   Sun Oct 27 22:02:13 2002
  * Modified by:   Martin Diehl <mad@mdiehl.de>
- *
+ *
  *     Copyright (c) 1998-1999 Dag Brattli, All Rights Reserved.
  *     Copyright (c) 1999 Jean Tourrilhes
  *     Copyright (c) 2002 Martin Diehl
- *     
- *     This program is free software; you can redistribute it and/or
- *     modify it under the terms of the GNU General Public License as
- *     published by the Free Software Foundation; either version 2 of
+ *
+ *     This program is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of
  *     the License, or (at your option) any later version.
- * 
+ *
  *     Neither Dag Brattli nor University of Troms admit liability nor
- *     provide warranty for any of this software. This material is
+ *     provide warranty for any of this software. This material is
  *     provided "AS-IS" and at no charge.
- *    
+ *
  ********************************************************************/
 
 /*
@@ -48,7 +48,7 @@
 
 #include "sir-dev.h"
 
-/*
+/*
  * Define the timing of the pulses we send to the dongle (to reset it, and
  * to toggle speeds). Basically, the limit here is the propagation speed of
  * the signals through the serial port, the dongle being much faster.  Any
@@ -172,9 +172,9 @@ static int actisys_change_speed(struct sir_dev *dev, 
unsigned speed)
      * we are in known state (dongle default)
      */
 
-    /*
+    /*
      * Now, we can set the speed requested. Send RTS pulses until we
-         * reach the target speed
+         * reach the target speed
      */
     for (i = 0; i < MAX_SPEEDS; i++) {
         if (speed = baud_rates[i]) {
@@ -230,14 +230,14 @@ static int actisys_reset(struct sir_dev *dev)
 
     /* Go back to normal mode */
     sirdev_set_dtr_rts(dev, TRUE, TRUE);
-   
+
     dev->speed = 9600;    /* That's the default */
 
     return 0;
 }
 
 MODULE_AUTHOR("Dag Brattli <dagb@cs.uit.no> - Jean Tourrilhes 
<jt@hpl.hp.com>");
-MODULE_DESCRIPTION("ACTiSYS IR-220L and IR-220L+ dongle driver");   
+MODULE_DESCRIPTION("ACTiSYS IR-220L and IR-220L+ dongle driver");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("irda-dongle-2"); /* IRDA_ACTISYS_DONGLE */
 MODULE_ALIAS("irda-dongle-3"); /* IRDA_ACTISYS_PLUS_DONGLE */

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
