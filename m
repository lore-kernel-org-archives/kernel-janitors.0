From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 25 Jan 2005 22:04:00 +0000
Subject: [KJ] [PATCH] 1/34: atm/horizon: replace interruptible_sleep_on()
Message-Id: <20050125220400.GB2689@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0075953363603495916=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============0075953363603495916==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_interruptible() instead of the deprecated
interruptible_sleep_on(). In the new code, the debug statements will *not* be
printed every iteration of the loop; instead they will be printed before the
sleep begins and after the sleep is completed. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.11-rc2-kj-v/drivers/atm/horizon.c	2005-01-24 09:34:04.000000000 -0800
+++ 2.6.11-rc2-kj/drivers/atm/horizon.c	2005-01-24 13:53:02.000000000 -0800
@@ -39,6 +39,7 @@
 #include <linux/uio.h>
 #include <linux/init.h>
 #include <linux/ioport.h>
+#include <linux/wait.h>
 
 #include <asm/system.h>
 #include <asm/io.h>
@@ -1089,13 +1090,11 @@ static inline void rx_bus_master_complet
 /********** (queue to) become the next TX thread **********/
 
 static inline int tx_hold (hrz_dev * dev) {
-  while (test_and_set_bit (tx_busy, &dev->flags)) {
-    PRINTD (DBG_TX, "sleeping at tx lock %p %lu", dev, dev->flags);
-    interruptible_sleep_on (&dev->tx_queue);
-    PRINTD (DBG_TX, "woken at tx lock %p %lu", dev, dev->flags);
-    if (signal_pending (current))
-      return -1;
-  }
+  PRINTD (DBG_TX, "sleeping at tx lock %p %lu", dev, dev->flags);
+  wait_event_interruptible(dev->tx_queue, (!test_and_set_bit(tx_busy, &dev->flags)));
+  PRINTD (DBG_TX, "woken at tx lock %p %lu", dev, dev->flags);
+  if (signal_pending (current))
+    return -1;
   PRINTD (DBG_TX, "set tx_busy for dev %p", dev);
   return 0;
 }

--===============0075953363603495916==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0075953363603495916==--
