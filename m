From: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>
Date: Thu, 14 Apr 2005 21:46:18 +0000
Subject: [KJ] [PATCH] drivers/ieee1394/hosts.c : Use of time_before()
Message-Id: <425EE4AA.8040305@feitoza.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <425D3FF0.1020406@feitoza.com.br>
In-Reply-To: <425D3FF0.1020406@feitoza.com.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Again, following Nish's instruction, the time_after() macro, was 
removed, and a time_before() macro was placed there.

Signed-off-by: Marcelo Feitoza Parisi <marcelo@feitoza.com.br>

--- linux/drivers/ieee1394/hosts.c      2005-03-02 04:38:07.000000000 -0300
+++ development/drivers/ieee1394/hosts.c        2005-04-14 
18:44:06.000000000 -0300
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
-       if (jiffies - host->csr.gen_timestamp[next_gen] < 60 * HZ)
+       if (time_before(jiffies, host->csr.gen_timestamp[next_gen] + 60 
* HZ))
                /* Wait 60 seconds from the last time this generation 
number was
                 * used. */
                reset_delay = (60 * HZ) + 
host->csr.gen_timestamp[next_gen] - jiffies;

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
