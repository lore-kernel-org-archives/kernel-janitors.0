From: "Mikael Starvik" <mikael.starvik@axis.com>
Date: Wed, 26 Jan 2005 05:47:55 +0000
Subject: [KJ] RE: [PATCH] 17/34: cris/eeprom: replace
Message-Id: <BFECAF9E178F144FAEF2BF4CE739C668014C7695@exmail1.se.axis.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13901043365159871=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============13901043365159871==
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Sure, thanks! I'll scan the rest of the drivers for similar things. 
Expect this to be included in 2.6.12.

Thanks for being a janitor and thanks for caring about our tiny arch!

/Mikael

-----Original Message-----
From: Nishanth Aravamudan [mailto:nacc@us.ibm.com] 
Sent: Wednesday, January 26, 2005 12:30 AM
To: Mikael Starvik
Cc: dev-etrax; kernel-janitors@lists.osdl.org
Subject: [PATCH] 17/34: cris/eeprom: replace interruptible_sleep_on() with
wait_event_interruptible()


Hi,

Please consider applying.

Description: Use wait_event_interruptible() instead of the deprecated
interruptible_sleep_on(). The replacements were both straight-forward as
the sleeps were conditionally-looped. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/arch/cris/arch-v10/drivers/eeprom.c	2005-01-24
09:28:13.000000000 -0800
+++ 2.6.11-rc2-kj/arch/cris/arch-v10/drivers/eeprom.c	2005-01-25
15:28:54.000000000 -0800
@@ -94,6 +94,7 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/wait.h>
 #include <asm/uaccess.h>
 #include "i2c.h"
 
@@ -526,15 +527,9 @@ static ssize_t eeprom_read(struct file *
     return -EFAULT;
   }
   
-  while(eeprom.busy)
-  {
-    interruptible_sleep_on(&eeprom.wait_q);
-
-    /* bail out if we get interrupted */
-    if (signal_pending(current))
-      return -EINTR;
-    
-  }
+  wait_event_interruptible(eeprom.wait_q, !eeprom.busy);
+  if (signal_pending(current))
+    return -EINTR;
   eeprom.busy++;
 
   page = (unsigned char) (p >> 8);
@@ -604,13 +599,10 @@ static ssize_t eeprom_write(struct file 
     return -EFAULT;
   }
 
-  while(eeprom.busy)
-  {
-    interruptible_sleep_on(&eeprom.wait_q);
-    /* bail out if we get interrupted */
-    if (signal_pending(current))
-      return -EINTR;
-  }
+  wait_event_interruptible(eeprom.wait_q, !eeprom.busy);
+  /* bail out if we get interrupted */
+  if (signal_pending(current))
+    return -EINTR;
   eeprom.busy++;
   for(i = 0; (i < EEPROM_RETRIES) && (restart > 0); i++)
   {


--===============13901043365159871==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13901043365159871==--
