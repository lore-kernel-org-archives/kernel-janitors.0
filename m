From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 17 Sep 2004 17:07:14 +0000
Subject: [Kernel-janitors] [PATCH 2.6.9-rc2 5/15] isdn/hardware: remove
Message-Id: <20040917170714.GF1712@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============42189951756550226=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============42189951756550226==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Any comments would be appreciated. This is a re-push of a patch
submitted a few months ago which has not been merged as of
2.6.9-rc1-mm5 / 2.6.9-rc2.

Description: Remove macro definition of milliseonds(). Will be replaced
with msecs_to_jiffies().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.9-rc2-vanilla/drivers/isdn/sc/hardware.h	2004-09-13 17:16:04.000000000 -0700
+++ 2.6.9-rc2/drivers/isdn/sc/hardware.h	2004-09-14 14:05:21.000000000 -0700
@@ -104,9 +104,6 @@
  * Some handy macros
  */
 
-/* Return the number of jiffies in a given number of msecs */
-#define milliseconds(x)	(((x)*HZ)/1000)
-
 /* Determine if a channel number is valid for the adapter */
 #define IS_VALID_CHANNEL(y,x)	((x>0) && (x <= sc_adapter[y]->channels))
 

--===============42189951756550226==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============42189951756550226==--
