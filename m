From: Aaron Cripps <acripps@gmail.com>
Date: Tue, 29 May 2007 21:11:15 +0000
Subject: [KJ] Re: [PATCH ARRAY_SIZE 1/4] kernel 2.6 size macro clean ups in
Message-Id: <465C99C3.4030802@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090403040407010908060304"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------090403040407010908060304
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



--------------090403040407010908060304
Content-Type: text/plain;
 name="actisys-sir_ArraySize.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline;
 filename="actisys-sir_ArraySize.patch"

removed the MAX_SPEEDS macro in favor of the more generic ARRAY_SIZE macro
defined in kernel.h
Also cleaned up trailing whitespaces.
Compile tested, no issues found at compile time.

Signed-off-by: Aaron Cripps <cripps@cs.mun.ca>


diff -Nuar linux-2.6/drivers/net/irda/actisys-sir.c linux-2.6-patched/drivers/net/irda/actisys-sir.c
--- linux-2.6/drivers/net/irda/actisys-sir.c	2007-05-22 20:31:01.000000000 -0230
+++ linux-2.6-patched/drivers/net/irda/actisys-sir.c	2007-05-25 22:51:22.000000000 -0230
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
  *     Neither Dag Brattli nor University of Troms������ admit liability nor
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
@@ -67,8 +67,6 @@
 /* Note : the 220L doesn't support 38400, but we will fix that below */
 static unsigned baud_rates[] = { 9600, 19200, 57600, 115200, 38400 };
 
-#define MAX_SPEEDS (sizeof(baud_rates)/sizeof(baud_rates[0]))
-
 static struct dongle_driver act220l = {
 	.owner		= THIS_MODULE,
 	.driver_name	= "Actisys ACT-220L",
@@ -166,17 +164,17 @@
 	int i = 0;
 
         IRDA_DEBUG(4, "%s(), speed=%d (was %d)\n", __FUNCTION__,
-        	speed, dev->speed);
+		speed, dev->speed);
 
 	/* dongle was already resetted from irda_request state machine,
 	 * we are in known state (dongle default)
 	 */
 
-	/* 
+	/*
 	 * Now, we can set the speed requested. Send RTS pulses until we
-         * reach the target speed 
+         * reach the target speed
 	 */
-	for (i = 0; i < MAX_SPEEDS; i++) {
+	for (i = 0; i < ARRAY_SIZE(baud_rates); i++) {
 		if (speed == baud_rates[i]) {
 			dev->speed = speed;
 			break;
@@ -191,7 +189,7 @@
 	}
 
 	/* Check if life is sweet... */
-	if (i >= MAX_SPEEDS) {
+	if (i >= ARRAY_SIZE(baud_rates)) {
 		actisys_reset(dev);
 		ret = -EINVAL;  /* This should not happen */
 	}

--------------090403040407010908060304
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
--------------090403040407010908060304--
