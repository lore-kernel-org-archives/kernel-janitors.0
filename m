From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 01 Sep 2004 22:47:08 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc1-bk7] isdn/sc/hardware: remove
Message-Id: <20040901224708.GG2516@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71289500543930417=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040901222224.GD2516@us.ibm.com>
In-Reply-To: <20040901222224.GD2516@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============71289500543930417==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This is one of 10 patches which have either not been pushed to mainline
(2.6.9-rc1-bk7) or have not been included in any of the recent kjt's.

Applys-to: 2.6.9-rc1-bk7

Depends-on: 2.6.9-rc1-bk7-kjt1 patch, which removes usage of
milliseconds() from init.c and card.h.

Description: Removes milliseconds() macro. msecs_to_jiffies() [#include
<linux/time.h>] should be used instead.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- 2.6.9-rc1-bk7-vanilla/drivers/isdn/sc/hardware.h	2004-08-31 21:26:46.000000000 +0000
+++ 2.6.9-rc1-bk7-dev/drivers/isdn/sc/hardware.h	2004-09-01 21:42:28.000000000 +0000
@@ -104,9 +104,6 @@
  * Some handy macros
  */
 
-/* Return the number of jiffies in a given number of msecs */
-#define milliseconds(x)	(((x)*HZ)/1000)
-
 /* Determine if a channel number is valid for the adapter */
 #define IS_VALID_CHANNEL(y,x)	((x>0) && (x <= sc_adapter[y]->channels))
 

--===============71289500543930417==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71289500543930417==--
