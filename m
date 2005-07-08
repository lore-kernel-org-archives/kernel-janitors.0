From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Fri, 08 Jul 2005 19:32:31 +0000
Subject: [KJ] [PATCH] drivers/ieee1394/hosts.c : Use of time_before macro
Message-Id: <42CED4CF.90906@feitoza.com.br>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------070103070508080203000609"
List-Id: <kernel-janitors.vger.kernel.org>
References: <425D3FF0.1020406@feitoza.com.br>
In-Reply-To: <425D3FF0.1020406@feitoza.com.br>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------070103070508080203000609
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Use of time_before() macro, defined at linux/jiffies.h, which deal with
wrapping correctly and are nicer to read.

--------------070103070508080203000609
Content-Type: text/x-patch;
 name="hosts.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="hosts.patch"

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/ieee1394/hosts.c	2005-06-17 16:48:29.000000000 -0300
+++ linux-kj/drivers/ieee1394/hosts.c	2005-07-07 20:38:07.609477888 -0300
@@ -18,6 +18,7 @@
 #include <linux/slab.h>
 #include <linux/pci.h>
 #include <linux/timer.h>
+#include <linux/jiffies.h>
 
 #include "csr1212.h"
 #include "ieee1394.h"
@@ -217,7 +218,7 @@
 
 	/* IEEE 1394a-2000 prohibits using the same generation number
 	 * twice in a 60 second period. */
-	if (jiffies - host->csr.gen_timestamp[next_gen] < 60 * HZ)
+	if (time_before(jiffies, host->csr.gen_timestamp[next_gen] + 60 * HZ))
 		/* Wait 60 seconds from the last time this generation number was
 		 * used. */
 		reset_delay = (60 * HZ) + host->csr.gen_timestamp[next_gen] - jiffies;

--------------070103070508080203000609
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------070103070508080203000609--
