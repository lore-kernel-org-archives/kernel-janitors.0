From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 26 Jan 2005 00:35:20 +0000
Subject: [KJ] [PATCH 28/34] net/pktgen: replace
Message-Id: <20050126003520.GT12649@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86048792617320546=="
List-Id: <kernel-janitors.vger.kernel.org>
To: robert.olsson@its.uu.se
Cc: netdev@oss.sgi.com, kernel-janitors@lists.osdl.org

--===============86048792617320546==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please consider applying.

Description: Use wait_event_timeout() instead of the deprecated
interruptible_sleep_on_timeout(). Current code does not check for signals, so
interruptible seems unnecessary. Patch is compile-tested.

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>

--- 2.6.11-rc2-kj-v/net/core/pktgen.c	2005-01-24 09:34:21.000000000 -0800
+++ 2.6.11-rc2-kj/net/core/pktgen.c	2005-01-24 17:18:52.000000000 -0800
@@ -135,6 +135,7 @@
 #include <linux/ipv6.h>
 #include <linux/udp.h>
 #include <linux/proc_fs.h>
+#include <linux/wait.h>
 #include <net/checksum.h>
 #include <net/ipv6.h>
 #include <net/addrconf.h>
@@ -3118,8 +3119,7 @@ static void __exit pg_cleanup(void)
                 struct pktgen_thread *t = pktgen_threads;
                 pktgen_threads->control |= (T_TERMINATE);
 
-                while( t == pktgen_threads) 
-                        interruptible_sleep_on_timeout(&queue, HZ);
+		wait_event_timeout(queue, (t != pktgen_threads), HZ);
         }
 
         /* Un-register us from receiving netdevice events */

--===============86048792617320546==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86048792617320546==--
