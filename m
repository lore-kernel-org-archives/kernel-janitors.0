From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 25 Jan 2005 23:30:09 +0000
Subject: [KJ] [PATCH] 17/34: cris/eeprom: replace interruptible_sleep_on()
Message-Id: <20050125233009.GG12649@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34741122040469841=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============34741122040469841==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_interruptible() instead of the deprecated
interruptible_sleep_on(). The replacements were both straight-forward as
the sleeps were conditionally-looped. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/arch/cris/arch-v10/drivers/eeprom.c	2005-01-24 09:28:13.000000000 -0800
+++ 2.6.11-rc2-kj/arch/cris/arch-v10/drivers/eeprom.c	2005-01-25 15:28:54.000000000 -0800
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

--===============34741122040469841==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34741122040469841==--
