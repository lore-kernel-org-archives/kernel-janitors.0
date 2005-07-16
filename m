From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Sat, 16 Jul 2005 07:14:52 +0000
Subject: [KJ] [PATCH] drivers/atm/iphase.c : Use of the time_after() macro
Message-Id: <42D8B3EC.4090809@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090603050701070504090104"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------090603050701070504090104
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------090603050701070504090104
Content-Type: text/x-patch;
 name="iphase.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="iphase.patch"

Use of the time_after() macro, defined at linux/jiffies.h, which deal
with wrapping correctly and are nicer to read.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/atm/iphase.c	2005-06-17 16:48:29.000000000 -0300
+++ linux-kj/drivers/atm/iphase.c	2005-07-16 01:51:51.088494968 -0300
@@ -60,7 +60,8 @@
 #include <asm/uaccess.h>  
 #include <asm/string.h>  
 #include <asm/byteorder.h>  
-#include <linux/vmalloc.h>  
+#include <linux/vmalloc.h> 
+#include <linux/jiffies.h>
 #include "iphase.h"		  
 #include "suni.h"		  
 #define swap(x) (((x & 0xff) << 8) | ((x & 0xff00) >> 8))  
@@ -189,7 +190,8 @@
   int ltimeout;
 
   ia_hack_tcq (dev);
-  if(((jiffies - timer)>50)||((dev->ffL.tcq_rd==dev->host_tcq_wr))){      
+  if(time_after(jiffies, timer + 50)
+		  ||((dev->ffL.tcq_rd==dev->host_tcq_wr))){      
      timer = jiffies; 
      i=0;
      while (i < dev->num_tx_desc) {

--------------090603050701070504090104
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------090603050701070504090104--
