From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 17:08:47 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 6/15] isdn/card: replace
Message-Id: <20040917170847.GG1712@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30100428965606696=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============30100428965606696==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch
submitted a few months ago which has not been merged as of
2.6.9-rc1-mm5 / 2.6.9-rc2.

Description: Remove macro definition of milliseonds() and replace
with msecs_to_jiffies().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/isdn/sc/card.h	2004-09-13 17:16:04.000000000 -0700
+++ 2.6.9-rc2/drivers/isdn/sc/card.h	2004-09-17 10:05:27.000000000 -0700
@@ -25,23 +25,24 @@
  */
 #include <linux/timer.h>
 #include <linux/isdnif.h>
+#include <linux/time.h>
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

--===============30100428965606696==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30100428965606696==--
