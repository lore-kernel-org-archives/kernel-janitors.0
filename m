From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 28 Jul 2004 18:13:51 +0000
Subject: [Kernel-janitors] [PATCH] isdn/card: replace milliseconds() with
Message-Id: <20040728181351.GJ1935@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94362392886471325=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============94362392886471325==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list.

-Nish

Applys-to: 2.6.7

Description: Replaces calls to milliseconds() with msecs_to_jiffies().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/isdn/sc/card.h	2004-06-15 22:20:04.000000000 -0700
+++ linux-dev/drivers/isdn/sc/card.h	2004-07-28 10:55:38.000000000 -0700
@@ -24,24 +24,25 @@
  * We need these if they're not already included
  */
 #include <linux/timer.h>
+#include <linux/time.h>
 #include <linux/isdnif.h>
 #include "message.h"
 
 /*
  * Amount of time to wait for a reset to complete
  */
-#define CHECKRESET_TIME		milliseconds(4000)
+#define CHECKRESET_TIME		msecs_to_jiffies(4000)
 
 /*
  * Amount of time between line status checks
  */
-#define CHECKSTAT_TIME		milliseconds(8000)
+#define CHECKSTAT_TIME		msecs_to_jiffies(8000)
 
 /*
  * The maximum amount of time to wait for a message response
  * to arrive. Use exclusively by send_and_receive
  */
-#define SAR_TIMEOUT		milliseconds(10000)
+#define SAR_TIMEOUT		msecs_to_jiffies(10000)
 
 /*
  * Macro to determine is a card id is valid

--===============94362392886471325==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94362392886471325==--
