From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 28 Jul 2004 18:13:57 +0000
Subject: [Kernel-janitors] [PATCH] isdn/hardware: remove milliseconds()
Message-Id: <20040728181357.GK1935@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66540596971297372=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============66540596971297372==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Depends-on: Patch to card.h which replaces milliseconds() with
msecs_to_jiffies().

Description: Removes definition of milliseconds() in favor of
msecs_to_jiffies().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/isdn/sc/hardware.h	2004-06-15 22:20:03.000000000 -0700
+++ linux-dev/drivers/isdn/sc/hardware.h	2004-07-28 10:54:50.000000000 -0700
@@ -104,9 +104,6 @@
  * Some handy macros
  */
 
-/* Return the number of jiffies in a given number of msecs */
-#define milliseconds(x)	(x/(1000/HZ))
-
 /* Determine if a channel number is valid for the adapter */
 #define IS_VALID_CHANNEL(y,x)	((x>0) && (x <= sc_adapter[y]->channels))
 

--===============66540596971297372==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66540596971297372==--
